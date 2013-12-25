package com.megagrand.mapedit.controller
{
	import com.megagrand.mapedit.model.MapProxy;
	import com.megagrand.mapedit.model.vo.FacadeNotification;
	import com.megagrand.mapedit.util.MapAssetsManager;
	import com.megagrand.mapedit.view.MapSettingPanelMediator;
	import com.megagrand.mapedit.view.SceneMapMediator;
	import com.megagrand.mapedit.view.ToolsPanelMediator;
	import com.megagrand.mapedit.view.ViewPanelMediator;
	import com.megagrand.mapedit.view.ui.MapSettingPanel;
	import com.megagrand.mapedit.view.ui.ViewPanel;
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.FileFilter;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	
	import mx.managers.PopUpManager;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	/**
	 * 地图设置命令，处理地图设置参数，初始化网格、mapVO、tileGameLayer层；
	 * @author leo
	 * 
	 */	
	public class MapSettingCommand extends SimpleCommand implements ICommand
	{
		private var mapSettingPanle :MapSettingPanel;
		private var swfFile :File;
		private var imgFile :File;
		private var img :Bitmap;
		private var fileStream :FileStream;
		private var _fileData :ByteArray;
		private var imgLoader :Loader;
		public function MapSettingCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			var mapSettingPanleMediator :MapSettingPanelMediator = facade.retrieveMediator(MapSettingPanelMediator.NAME) as MapSettingPanelMediator;
			this.mapSettingPanle = mapSettingPanleMediator.mapSettingPanel;
			
			PopUpManager.addPopUp(mapSettingPanle,MapEdit.instance,true);
			PopUpManager.centerPopUp(mapSettingPanle);
			
			mapSettingPanle.btnOK.addEventListener(MouseEvent.CLICK,btnOKHandler);
			mapSettingPanle.btnCanel.addEventListener(MouseEvent.CLICK,btnCanelHandler);
//			mapSettingPanle.btnOpenSource.addEventListener(MouseEvent.CLICK,btnOpenSourceHandler);
			mapSettingPanle.btnOpenImg.addEventListener(MouseEvent.CLICK,btnOpenImgHandler);
		}

		private function btnOKHandler(event :MouseEvent):void
		{
//			trace("ok");
			//检查地图数据是否输入
			if(this.mapSettingPanle.txtMapName.text == "")
			{
				this.mapSettingPanle.txtMapName.errorString = "请输入地图名字"
				return;
			} else
			{
				this.mapSettingPanle.txtMapName.errorString = "";
			}
			
			if(this.mapSettingPanle.txtMapWidth.text == "")
			{
				this.mapSettingPanle.txtMapWidth.errorString = "请输入地图宽";
				return;
			} else
			{
				this.mapSettingPanle.txtMapWidth.errorString = "";
			}
			
			if(this.mapSettingPanle.txtMapHeight.text == "")
			{
				this.mapSettingPanle.txtMapHeight.errorString = "请输入地图高";
				return;
			} else
			{
				this.mapSettingPanle.txtMapHeight.errorString = "";
			}
			
			if(this.mapSettingPanle.txtTileWidth.text == "")
			{
				this.mapSettingPanle.txtTileWidth.errorString = "请输入方块宽";
				return;
			} else
			{
				this.mapSettingPanle.txtTileWidth.errorString = "";
			}
			
			if(this.mapSettingPanle.txtTileHeight.text == "")
			{
				this.mapSettingPanle.txtTileHeight.errorString = "请输入方块高";
				return;
			} else
			{
				this.mapSettingPanle.txtTileHeight.errorString = "";
			}
			
//			if(this.mapSettingPanle.txtSource.text == "")
//			{
//				this.mapSettingPanle.txtSource.errorString = "请导入资源路径";
//				return;
//			} else
//			{
//				this.mapSettingPanle.txtSource.errorString = "";
//			}
			
			var sceneMapMediator :SceneMapMediator = facade.retrieveMediator(SceneMapMediator.NAME) as SceneMapMediator;
			//画背景网格
			var w :int = int(this.mapSettingPanle.txtMapWidth.text);
			var h :int =  int(this.mapSettingPanle.txtMapHeight.text);
			var tileW :Number = Number(this.mapSettingPanle.txtTileWidth.text);
			var tileH :Number =  Number(this.mapSettingPanle.txtTileHeight.text);
			var mapProxy :MapProxy = facade.retrieveProxy(MapProxy.NAME) as MapProxy;
			//初始化MapVO
			mapProxy.createMapVO(w,h,tileW,tileH);
			mapProxy.mapVO.mapName = this.mapSettingPanle.txtMapName.text;
			mapProxy.mapVO.swfPath = this.mapSettingPanle.txtSource.text;
			var px :int = int(this.mapSettingPanle.txtX.text);
			var py :int = int(this.mapSettingPanle.txtY.text);
			mapProxy.mapVO.imgPath = this.mapSettingPanle.txtImg.text;
			mapProxy.mapVO.px = px;
			mapProxy.mapVO.py = py;
			sceneMapMediator.initTileGameLayer(this.img,px,py);
			if(this._fileData)
			{
				//加载写入的信息
				MapAssetsManager.getInstance().sourceLoader(_fileData);
			}
			//屏蔽工具栏创建地图按钮
			var toolsPanelMediator :ToolsPanelMediator = facade.retrieveMediator(ToolsPanelMediator.NAME) as ToolsPanelMediator;
			toolsPanelMediator.toolsPanel.btnCreate.enabled = false;
			toolsPanelMediator.toolsPanel.btnOpen.enabled = false;
			mapSettingPanle.btnOK.enabled = false;
			PopUpManager.removePopUp(this.mapSettingPanle); 
		}

		private function btnCanelHandler(event :MouseEvent):void
		{
			//删除弹出的地图设置窗口 
			PopUpManager.removePopUp(this.mapSettingPanle);
			if(this.swfFile) this.swfFile.cancel();
			mapSettingPanle.btnOK.removeEventListener(MouseEvent.CLICK,btnOKHandler);
			mapSettingPanle.btnCanel.removeEventListener(MouseEvent.CLICK,btnCanelHandler);
			mapSettingPanle.btnOpenSource.removeEventListener(MouseEvent.CLICK,btnOpenSourceHandler);
			mapSettingPanle.btnOK.enabled = true;
		}
		
		private function btnOpenSourceHandler(event :MouseEvent):void
		{
			//选择swf文件
			swfFile = new File();
			swfFile.browseForOpen("Open",[new FileFilter("*swf","*swf")]);
			swfFile.addEventListener(Event.SELECT,sourceSelectHandler);
		}
		
		private function sourceSelectHandler(event :Event):void
		{
//			trace((event.currentTarget as File).nativePath);
			this.fileStream = new FileStream();
			fileStream.open(event.currentTarget as File,FileMode.READ);
			
			mapSettingPanle.txtSource.text = swfFile.nativePath; 
//			trace(swfFile.url);
			//写入byteArray
			var fileData:ByteArray = new ByteArray();
			fileStream.readBytes( fileData, 0, fileStream.bytesAvailable );
			fileStream.close();
			
			this._fileData = fileData;
		}
		/**打开图片控制器*/		
		private function btnOpenImgHandler(event :MouseEvent):void
		{
			this.imgFile = new File();
			this.imgFile.browseForOpen("open",[new FileFilter("*.jpg;*.gif;*.png","*.jpg;*.gif;*.png")]);
			this.imgFile.addEventListener(Event.SELECT,imgSelectHandler);
		}
		/** 图片选择*/		
		private function imgSelectHandler(event :Event):void
		{
//			trace(event.currentTarget.nativePath);
			if(event.currentTarget.nativePath)
			{
				this.mapSettingPanle.txtImg.text = event.currentTarget.nativePath;
				this.imgLoader = new Loader();
				this.imgLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,imgLoadCompleteHandler);
				this.imgLoader.load(new URLRequest(event.currentTarget.nativePath));
			}
		}
		/**图片load完*/		
		private function imgLoadCompleteHandler(event :Event):void
		{
			var bmp :Bitmap = ((event.target) as LoaderInfo).content as Bitmap;
			this.img = bmp;
			this.imgLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE,imgLoadCompleteHandler);
		}
	}
}