package ui
{
	import com.yo.manager.ui.UIManager;
	import com.yo.mvc.core.BaseController;
	
	import core.Config;
	import core.GlobalEvent;
	import core.GlobalEventDispatcher;
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.FileFilter;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	
	import ui.MapEditor;
	import ui.UIContainer;
	
	public class MapEditorController extends BaseController
	{
		public function MapEditorController()
		{
			super();
		}
		
		override protected function init():void{
			super.init();
			
			_resourceLoaded = true;
			
			show();
		}
		
		override protected function initModel():void{
			_model = new MapEditorModel();
		}
		
		override protected function initView():void{
			_view = new MapEditorView(_model);
		}
		
		override protected function initEvent():void{
			super.initEvent();
			
			GlobalEventDispatcher.addEventListener(GlobalEvent.BUTTON_BAR_CLICK, __buttonBarClick);
		}
		/**
		 * 打开地图文件
		 */
		private function openFile():void
		{
			var file:File = new File(Config.picturePath);
			var filter:FileFilter = new FileFilter("地图背景", "*.jpg");
			file.browseForOpen("选择地图背景",[filter]);
			file.addEventListener(Event.SELECT, __fileSelect);
		}
		
		/**
		 * 添加背景
		 */		
		private function __fileSelect(e:Event):void
		{
			var file:File = e.target as File;
			file.removeEventListener(Event.SELECT, __fileSelect);
			
			var fs:FileStream = new FileStream();
			fs.open(file, FileMode.READ);
			
			var bytes:ByteArray = new ByteArray();
			fs.readBytes(bytes, 0, fs.bytesAvailable);
			fs.close();
			
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, __loadComplete);
			loader.loadBytes(bytes);
		}
		
		/**
		 * 地图文件加载完成
		 */
		override protected function __loadComplete(e:Event):void
		{
			var loaderInfo:LoaderInfo = e.currentTarget as LoaderInfo;
			loaderInfo.removeEventListener(Event.COMPLETE, __loadComplete);
			var bm:Bitmap = loaderInfo.content as Bitmap;
			
			model.mapVO = new MapVO();
			
			GlobalEventDispatcher.dispatchEvent(GlobalEvent.LOAD_MAP_COMPLETE, bm);
		}
		
		private function __buttonBarClick(e:GlobalEvent):void
		{
			var data:String = e.data.toString();
			switch(data){
				case "open":
					openFile();
					break;
				case "save":
					saveMap();
					break;
				case "":
					
					break;
				default:
					break;
			}
		}
		
		private function saveMap():void
		{
			var str:String = "";
			var len:int = model.mapVO.collideList.length;
			for (var i:int = 0; i < len; i++) 
			{
				str = str.concat(model.mapVO.collideList[i] ? "1" : "0");
			}
			writeConfigFile(str);
		}
		
		protected function writeConfigFile(str:String):void {
			var byteArray:ByteArray = new ByteArray();
			byteArray.endian = Endian.LITTLE_ENDIAN;
			//版本号4字节
			byteArray.writeUnsignedInt(Config.version);
			//x 4字节
			byteArray.writeUnsignedInt(model.mapVO.x);
			//y 4字节
			byteArray.writeUnsignedInt(model.mapVO.y);
			//宽度4字节
			byteArray.writeUnsignedInt(model.mapVO.row);
			//高4字节
			byteArray.writeUnsignedInt(model.mapVO.column);
			//障碍物信息
			byteArray.writeUTF(str);
			
//			var str:String = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" + "\n" + str;
			var file:File = new File(Config.MAP_OUTPUT_PATH + model.mapVO.mapID + ".mps");
			var stream:FileStream = new FileStream();
			stream.open(file, FileMode.WRITE);
			stream.writeBytes(byteArray);
			stream.close();
		}
		
		private function get model():MapEditorModel{
			return _model as MapEditorModel;
		}
	}
}