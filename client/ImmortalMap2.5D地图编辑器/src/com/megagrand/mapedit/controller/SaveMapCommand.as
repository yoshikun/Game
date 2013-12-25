package com.megagrand.mapedit.controller
{
	import com.megagrand.mapedit.model.MapProxy;
	
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	
	import mx.controls.Alert;
	import mx.events.CloseEvent;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	/**
	 * 保存文件命令
	 * @author leo
	 * 
	 */	
	public class SaveMapCommand extends SimpleCommand implements ICommand
	{
		private var file :File;
		private var mapName :String;
		private var fileStream :FileStream;
		private var bytes :ByteArray;
		private var path :String;
		private var mapProxy :MapProxy;
		public function SaveMapCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			this.mapProxy = facade.retrieveProxy(MapProxy.NAME) as MapProxy;
			if(mapProxy && mapProxy.mapVO && mapProxy.mapVO.mapName)
			{
				this.mapName = mapProxy.mapVO.mapName;
				this.file = File.desktopDirectory.resolvePath(mapName + ".txt");
				this.fileStream = new FileStream();
				
				this.bytes = new ByteArray();
				this.path = mapProxy.mapVO.swfPath;
				//将mapVO写入bytes
//				bytes.writeObject(mapProxy.mapVO);
				Alert.show("是否保存所引用的SWF资源","提示",Alert.YES | Alert.NO,null,closeHandler);
			}
		}
		
		private function closeHandler(event :CloseEvent):void
		{
			if(event.detail == Alert.YES)
			{
				var startIndex :int = path.lastIndexOf("\\") + 1;
				var endIndex :int = path.lastIndexOf(".");
				var sourceName :String = path.substr(startIndex,endIndex);
				var sourceFile :File = File.applicationStorageDirectory.resolvePath(this.path);
				var newFile :File = File.desktopDirectory.resolvePath(sourceName);
				try
				{
					sourceFile.copyTo(newFile,true);
				}
				catch(error :Error)
				{
					trace("Error:", error.message);
				}
				this.bytes.compress();
				//写文件  
				this.fileStream.open(file, FileMode.WRITE); 
				this.fileStream.writeBytes(this.bytes,0,this.bytes.length);
				this.fileStream.close();  
				Alert.show("地图文件已保存在桌面","提示");
			}else
			{
				this.bytes.compress();
				var str :String = this.mapProxy.mapVO.paths.join("|");
				//写文件  
				this.fileStream.open(file, FileMode.WRITE); 
//				this.fileStream.writeBytes(this.bytes,0,this.bytes.length);
				this.fileStream.writeUTF(str);
				this.fileStream.close();  
				Alert.show("地图文件已保存在桌面","提示");
			}
		}
	}
}