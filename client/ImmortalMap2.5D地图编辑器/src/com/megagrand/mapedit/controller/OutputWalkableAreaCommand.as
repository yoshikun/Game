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
	 * 输出是否可通行区域命令 
	 * @author leo
	 * 
	 */	
	public class OutputWalkableAreaCommand extends SimpleCommand implements ICommand
	{
		public function OutputWalkableAreaCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			var mapProxy :MapProxy = facade.retrieveProxy(MapProxy.NAME) as MapProxy;
			if(mapProxy.mapVO && mapProxy.mapVO.paths)
			{
				var pathsAry :Array = mapProxy.mapVO.paths;
				var bytes :ByteArray = new ByteArray();
				
				var file :File = File.desktopDirectory.resolvePath("MapWalkableArea.a");
				var fileStream :FileStream = new FileStream();
				fileStream.open(file,FileMode.WRITE);
				
				var str :String = pathsAry.join("|");
				trace("是否可通行区域：" + str);
				bytes.writeUTFBytes(str);
				bytes.compress();
				fileStream.writeBytes(bytes);
				fileStream.close();
				Alert.show("地图是否可通行区域已输出","提示");
			}
		}
	}
}