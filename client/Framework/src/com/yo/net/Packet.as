package com.yo.net
{
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	import flash.utils.getTimer;
	
	/**
	 * 基本数据包
	 * @author Dalton
	 */
	public class Packet extends ByteArray 
	{
		private var _module:uint = 0;
		private var _action:uint = 0;

		public function Packet() 
		{
			this.endian = Endian.LITTLE_ENDIAN;
			position = 2;
		}
		
		public function get action():uint
		{
			if (_action == 0) {
				var op:uint = position;
				position = 1;
				_action = readUnsignedByte();
				position = op;
			}
			return _action;
		}
		
		public function set action(value:uint):void
		{
			_action = value;
			var op:uint = position;
       		position = 1;
			writeByte(value);
			position = op;
		}
		
		public function get module():uint
		{
			if (_module == 0) {
				var op:uint = position;
				position = 0;
				_module = readUnsignedByte();
				position = op;
			}
			return _module;
		}
		
		public function set module(value:uint):void
		{
			_module = value;
			var op:uint = position;
			position = 0;
			writeByte(value);
			position = op;
		}
		
		override public function clear():void {
			super.clear();
			_module = 0;
			_action = 0;
		}
		
		/**
		 * 写入字符串，0为结束符 
		 * @param s
		 * 
		 */        
		public function writeString(s:String):void {
			this.writeUTFBytes(s);
			this.writeByte(0);
		}
		
		/**
		 * 读取字符串 
		 * @return 
		 * 
		 */		
		public function readString():String {
			// 记录初始位置
			var oldp:uint = this.position,
				len:uint = 0;
			// 读取结束字符串
			while (0 != this.readByte()) {
				len++;
			}
			this.position = oldp;
			var res:String = this.readUTFBytes(len);
			this.position++;
			return res;
		}
		
		/**
		 * 16进制输出 
		 * @param str
		 * @return 
		 * 
		 */        
		public function hexDump(str:String = ""):String {
			var table:Array = [
				"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"
			]
			var oldpos:int = position;
			var output:String = str;
			position = 0;
			
			for (var i:int = 0; i < length; i++)
			{
				var byte:uint = readUnsignedByte();
				
				output += table[byte >> 4];
				output += table[byte & 0xF];
				output += ' ';
			}
			
			position = oldpos;
			return output;
		}
		
		public function set key(k:int):void {
			// 写两个字节
			var op:uint = position;
			position = 1;
			writeShort(k >> 16);
			// 写两字节
			position = 4;
			writeShort(k & 0xFFFF);
			position = op;
		}
		
		public function get key():int
		{
			var op:uint = position;
			position = 1;
			var i:int = readShort();
			position = 4;
			var j:int = readShort();
			position = op;
			return (i << 16) | (j & 0xFFFF);
		}
		
		public function encode():void {
			var oldpos:int = position;
			position = 0;
			
			var newByte:Packet = new Packet();
			var t:int = getTimer();
			var count:int = 50;
			for (var i:int = 0; i < 100; i++)
			{
				var byte:uint = i;
				
				byte ^= count;
				count++;
				newByte.writeByte(byte);
			}
			trace(newByte.hexDump("加密后"));
		}
		
		/**
		 * 写入定长字符串 
		 * @param str
		 * @param len
		 * 
		 */        
		public function writeMultiBytes(str:String, len:int):void{
			var b:ByteArray = new ByteArray();
			b.writeMultiByte(str, "utf-8");
			this.writeMultiByte(str, "utf-8");
			if(b.length < len){
				var cur:int = b.length;
				for (var i:int = 0; i < len - cur; i++){
					this.writeByte(0);
				}
			}
		}
	}
	
}