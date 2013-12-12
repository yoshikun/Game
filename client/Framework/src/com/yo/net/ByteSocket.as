package com.yo.net
{
	import com.adobe.serialization.json.JSON;
	import com.yo.logger.Log;
	
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;
	import flash.system.Security;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	import flash.utils.getQualifiedClassName;
	
	public class ByteSocket extends EventDispatcher
	{
		private var _socket :Socket;
		
		private var _ip:String;
		
		private var _port:Number;
		
		private var _headLen:uint = 4;
		private var _bodyLen:uint;
		private var _headerBuffer:ByteArray;
		private var _bodyBuffer:Packet;
		
		public var protocol:IProtocol;
		
		/**
		 * 序列号 
		 */		
		private var index:uint = 0;
		private var key:uint = 0;
		
		public function ByteSocket(encrypted:Boolean = true) 
		{
			_headerBuffer= new ByteArray();
			_headerBuffer.endian = Endian.LITTLE_ENDIAN;
			
			_bodyBuffer = new Packet();
		}
		
		public function connect(ip:String, port:int):void 
		{
			Log.getLog(this).debug("请求crossdomain.xml");
			Security.loadPolicyFile("xmlsocket://115.28.2.190/crossdomain.xml")
			try{
				if(_socket){
					close();
				}
				
				_socket = new Socket();
				initEvent();
				
				_ip = ip;
				_port = port;
				
				_socket.connect(ip,port);
			}catch(err:Error){
				dispatchEvent(new ErrorEvent(ErrorEvent.ERROR,false,false,err.message));
			}
		}
		
		private function initEvent():void
		{
			_socket.addEventListener(Event.CONNECT, handleConnect);
			_socket.addEventListener(Event.CLOSE, handleClose);
			_socket.addEventListener(ProgressEvent.SOCKET_DATA, handleIncoming);
			_socket.addEventListener(IOErrorEvent.IO_ERROR, handleIoError);
			_socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityError);
		}
		
		private function removeEvent():void
		{
			_socket.removeEventListener(Event.CONNECT, handleConnect);
			_socket.removeEventListener(Event.CLOSE, handleClose);
			_socket.removeEventListener(ProgressEvent.SOCKET_DATA, handleIncoming);
			_socket.removeEventListener(IOErrorEvent.IO_ERROR, handleIoError);
			_socket.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, securityError);
		}
		
		private function handleIncoming(e:ProgressEvent):void
		{
			var readLen:uint = 0;
			while(_socket.bytesAvailable > 0){
				// 如果消息头长度还不够
				if(_headerBuffer.length < _headLen){
					readLen = _socket.bytesAvailable >(_headLen - _headerBuffer.length) ?(_headLen - _headerBuffer.length) : _socket.bytesAvailable;
					if(readLen > 0){
						//处理数据
						_socket.readBytes(_headerBuffer, _headerBuffer.length, readLen);                   
						
						//还没读够
						if(_headerBuffer.length < _headLen){
							continue;
						}
						
						_bodyLen = _headerBuffer.readUnsignedInt();
						
						//长度异常
						if(_bodyLen <= 0){
							_headerBuffer.clear();
							_bodyBuffer.clear();
							Log.getLog(this).warn("协议异常");
							continue;
						}
					}
				}
				
				// 如果消息体长度不够
				if(_bodyBuffer.length < _bodyLen){
					readLen = _socket.bytesAvailable >(_bodyLen - _bodyBuffer.length) ?(_bodyLen - _bodyBuffer.length) : _socket.bytesAvailable;
					if(readLen > 0){
						//处理数据
						_socket.readBytes(_bodyBuffer, _bodyBuffer.length, readLen);
						
						
						// 还没读够
						if(_bodyBuffer.length < _bodyLen){
							continue;
						}
						
						// 设置秘钥
						if(key == 97){
							key = _bodyBuffer.key;
						}
						
						var r:IResponse = protocol.lookup(_bodyBuffer.module, _bodyBuffer.action);
						if(!r){
							Log.getLog(this).warn("没有绑定协议处理器，协议(" + _bodyBuffer.module + ':' + _bodyBuffer.action + ")");
						}else{
							_bodyBuffer.position = 6;
							try{
								r.read(_bodyBuffer);
								// 由于反序列化比较耗，所以暂时硬编码判断
								var log:String = com.adobe.serialization.json.JSON.encode(r);
								Log.getLog(this).debug('接收协议：(' + _bodyBuffer.module + ':' + _bodyBuffer.action + ") " + getClassName(r) + " 内容： " + log);
								
								dispatchEvent(new ProtocolEvent(_bodyBuffer.module + ':' + _bodyBuffer.action, r));
							}catch(e:Error){
								Log.getLog(this).warn("协议解析错误，协议(" + _bodyBuffer.module + ':' + _bodyBuffer.action + ")");
							}
						}
						_headerBuffer.clear();
						_bodyBuffer.clear();
					}
				}
			}
		}
		
		public function get connected():Boolean
		{
			return _socket && _socket.connected;
		}
		
		public function isSame(ip:String,port:int):Boolean 
		{
			return _ip == ip && port == _port;
		}
		
		public function send(r:IRequest):void 
		{
			if(_socket && _socket.connected){
				var auth:uint = 0;
				if(key != 0 && index != 0){
					auth = key ^ index;
				}
				
				var p:Packet = new Packet();
				p.module = r.module;
				p.action = r.action;
				r.write(p);
				
				var allBytes:ByteArray = new ByteArray();
				allBytes.endian = Endian.LITTLE_ENDIAN;
				allBytes.writeUnsignedInt(p.length);
				allBytes.writeBytes(p);
				_socket.writeBytes(allBytes);
				_socket.flush();
				
				var log:String = com.adobe.serialization.json.JSON.encode(r);
				Log.getLog(this).debug('发送协议：(' + r.module + ':' + r.action + ") " + getClassName(r) + " 内容： " + log);
			}
		}
		
		private function getClassName(o:*):String{
			var name:String = getQualifiedClassName(o);
			var index:int = name.lastIndexOf('::');
			if(index != -1){
				return name.slice(name.lastIndexOf('::') + 2)
			}
			return name;
		}
		
		public function read():void
		{
			
		}
		
		public function sendString(data:String):void
		{
			if(_socket.connected)
			{
				_socket.writeUTF(data);
				_socket.flush();
			}
		}
		
		public  function close():void 
		{
			removeEvent();
			if(_socket.connected)
			{
				_socket.close();
			}
		}
		
		private function handleConnect(e:Event):void 
		{
			try{
				dispatchEvent(new Event(Event.CONNECT));
			}catch(erro:Error){
				trace(erro.getStackTrace());
			}
		}
		
		private function handleClose(e:Event):void 
		{
			try{
				removeEvent();
				dispatchEvent(new Event(Event.CLOSE));
			}catch(erro:Error){
				trace(erro.getStackTrace());
			}
		}
		
		private function handleIoError(e:ErrorEvent):void 
		{
			try{
				dispatchEvent(new ErrorEvent(ErrorEvent.ERROR,false,false,e.text));
			}catch(erro:Error){
				trace(erro.getStackTrace());
			}
		}
		
		/**
		 * 安全沙箱错误
		 */		
		private function securityError(e:SecurityErrorEvent):void
		{
			Log.getLog(this).debug("SECURITY_ERROR " + e.text);
			try{
				dispatchEvent(new SecurityErrorEvent(SecurityErrorEvent.SECURITY_ERROR,false,false,e.text));
			}catch(erro:Error){
				trace(erro.getStackTrace());
			}
		}
		
		public function dispose():void
		{
			if(_socket &&　_socket.connected){
				_socket.close();
			}
			_socket = null;
		}
	}
}
