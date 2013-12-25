package com.megagrand.mapedit.controller
{
	import com.megagrand.mapedit.model.MapProxy;
	import com.megagrand.mapedit.model.vo.FacadeNotification;
	import com.megagrand.mapedit.model.vo.MapVO;
	import com.megagrand.mapedit.view.ToolsPanelMediator;
	
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.FileFilter;
	import flash.utils.ByteArray;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	/**
	 * 打开地图文件命令、发送还原地图通知 
	 * @author leo
	 * 
	 */	
	public class OpenMapCommand extends SimpleCommand implements ICommand
	{
		private var fileToOpen :File;
		private var mapProxy :MapProxy;
		private var mapFile :File;
		public function OpenMapCommand()
		{
			super();
		}
		override public function execute(notification:INotification):void
		{
//			trace("打开文件");
			this.fileToOpen = File.desktopDirectory;
			this.fileToOpen.browseForOpen("Open",[new FileFilter("*.met","*.met")]);
			this.fileToOpen.addEventListener(Event.SELECT, fileSelected);
			this.mapProxy = facade.retrieveProxy(MapProxy.NAME) as MapProxy;
		}
		
		private function fileSelected(event:Event):void
		{
			var bytes :ByteArray = new ByteArray();
			var fileStream :FileStream = new FileStream();
			mapFile = event.target as File;
			trace(mapFile.nativePath);
			fileStream.open(mapFile,FileMode.READ);
			fileStream.readBytes(bytes,0,fileStream.bytesAvailable);
			fileStream.close();
			bytes.uncompress();
			var obj :Object = bytes.readObject();
			var mapVO :MapVO = objToVO(obj);
			//设置mapProxy中的data
			this.mapProxy.openMap(mapVO);
			//发送还原地图通知
			sendNotification(FacadeNotification.UI_CONTROL_RESTORE_MAP,mapVO);
			
			var toolPanleMediator :ToolsPanelMediator = facade.retrieveMediator(ToolsPanelMediator.NAME) as ToolsPanelMediator;
			toolPanleMediator.toolsPanel.btnCreate.enabled = false;
			toolPanleMediator.toolsPanel.btnOpen.enabled = false;
		}
		/**
		 *  obj转MapVO,如果MapVO中的属性改变，这里也要做相应的修改
		 * @param obj
		 * @return MapVO
		 * 
		 */		
		private function objToVO(obj :Object):MapVO
		{
			var vo :MapVO = new MapVO();
			vo.width = obj.width;
			vo.height = obj.height;
			vo.areaList = obj.areaList;
			vo.mapName = obj.mapName;
			vo.paths = obj.paths;
			vo.pathsObjAry = obj.pathsObjAry;
			vo.swfPath = obj.swfPath;
			vo.tilesTypeAry = obj.tilesTypeAry;
			vo.tileHeight = obj.tileHeight;
			vo.tilesObjAry = obj.tilesObjAry;
			vo.tileWidth = obj.tileWidth;
			vo.imgPath = obj.imgPath;
			vo.px = obj.px;
			vo.py = obj.py;
			
			vo.resetSwfPath = this.mapFile.nativePath;
			return vo;
		}
	}
}