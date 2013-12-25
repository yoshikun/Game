package com.megagrand.mapedit.controller
{
	import com.megagrand.mapedit.model.MapProxy;
	
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	
	import mx.controls.Alert;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	/**
	 * 输出地图纹理文件命令
	 * @author leo
	 * 
	 */	
	public class OutPutMapTextureCommand extends SimpleCommand implements ICommand
	{
		public function OutPutMapTextureCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			var mapProxy :MapProxy = facade.retrieveProxy(MapProxy.NAME) as MapProxy;
			if(mapProxy.mapVO && mapProxy.mapVO.tilesTypeAry)
			{
				var tileAry :Array = mapProxy.mapVO.tilesTypeAry;
				var bytes :ByteArray = new ByteArray();
				
				var file :File = File.desktopDirectory.resolvePath("MapTexture.map");
				var fileStream :FileStream = new FileStream();
				fileStream.open(file,FileMode.WRITE);
				
				var str :String = tileAry.join("|");
				trace("地图纹理：" + str);
				bytes.writeUTFBytes(str);
				bytes.compress();
				fileStream.writeBytes(bytes);
				fileStream.close();
				Alert.show("地图纹理已输出","提示");
			}
		}
	}
}