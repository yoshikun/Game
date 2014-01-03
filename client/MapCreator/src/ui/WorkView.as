package ui
{
	import com.yo.manager.InputManager;
	import com.yo.manager.ui.UIManager;
	import com.yo.mvc.core.BaseView;
	import com.yo.mvc.interfaces.IModel;
	
	import core.Config;
	
	import fl.controls.Button;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.geom.Point;
	import flash.net.FileFilter;
	import flash.net.URLRequest;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import flash.utils.ByteArray;
	
	import gs.easing.Back;
	
	import iso.DrawnIsoBox;
	import iso.DrawnIsoTile;
	import iso.IsoWorld;
	import iso.Point3D;
	
	import utils.IsoUtils;
	
	public class WorkView extends BaseView
	{
		/**
		 * 背景 
		 */		
		private var _background:Sprite;
		
		/**
		 * 地图数据 
		 */		
		private var _mapContainer:Sprite;
		
		/**
		 * 界面 
		 */		
		private var _uiContainer:Sprite;
		
		private var _container:Sprite;
		
		private var _world:IsoWorld;
		
		private var _openBtn:Button;
		
		public function WorkView(model:IModel=null)
		{
			super(model);
		}
		
		override protected function initView():void{
			_container = new Sprite();
			this.addChild(_container);
			
			_background = new Sprite();
			_container.addChild(_background);
			
			_mapContainer = new Sprite();
			_container.addChild(_mapContainer);
			
			_uiContainer = new Sprite();
			this.addChild(_uiContainer);
			
			_openBtn = new Button();
			_openBtn.label = "打开";
			_uiContainer.addChild(_openBtn);
			
			createWorld();
		}
		
		override protected function initEvent():void{
			super.initEvent();
			
			_openBtn.addEventListener(MouseEvent.CLICK, __openBtnClick);
			this.addEventListener(Event.ENTER_FRAME, __enterFrame);
		}
		
		private function createWorld():void{
			_world = new IsoWorld(10, 30);
			_mapContainer.addChild(_world);
			
			for(var i:int = 0; i < _world.cols; i++){
				for (var j:int = 0; j < _world.rows; j++){
					var tile:DrawnIsoTile = new DrawnIsoTile(_world.cellSize, 0x00FF00);
					tile.position = new Point3D(i * _world.cellSize, 0, j * _world.cellSize);
					_world.addChildToFloor(tile);
				}
			}
			
			_world.graphics.lineStyle(1, 0xFF0000);
			_world.graphics.moveTo(0, 0);
			_world.graphics.lineTo(0, _world.height);
			_world.graphics.moveTo(-_world.width / 2, _world.height / 2);
			_world.graphics.lineTo(_world.width / 2, _world.height / 2);
			_world.graphics.endFill();
			
//			_world.x = (Config.stage.stageWidth - _world.width) / 2 + _world.width / 2;
			_world.y = -_world.height / 2;
			
			Config.stage.addEventListener(MouseEvent.CLICK, __worldClick);
		}
		
		private function __worldClick(event:MouseEvent):void
		{
			return;
			var box:DrawnIsoBox = new DrawnIsoBox(_world.cellSize, Math.random() * 0xffffff, _world.cellSize);
			var pos:Point3D = IsoUtils.screenToIso(new Point(_world.mouseX, _world.mouseY));
			pos.x = Math.round(pos.x / _world.cellSize) * _world.cellSize;
			pos.y = Math.round(pos.y / _world.cellSize) * _world.cellSize;
			pos.z = Math.round(pos.z / _world.cellSize) * _world.cellSize;
			box.position = pos;
			_world.addChildToWorld(box);
		}
		
		private function initContainerPos():void
		{
			_container.x = 0;
			_container.y = 0;
		}
		
		protected function __enterFrame(e:Event):void
		{
			//可以拖动
			if(InputManager.instance.keyDown(Keyboard.SPACE)){
				Mouse.cursor = MouseCursor.HAND;
				
				if(InputManager.instance.mouseDown()){
					_container.startDrag();
				}else{
					_container.stopDrag();
				}
			}else{
				Mouse.cursor = MouseCursor.AUTO;
				_container.stopDrag();
			}
			
			if(InputManager.instance.mouseWheel){
				var delta:int = InputManager.instance.mouseWheelDelta;
				var preWidth:int = _container.width;
				var preHeight:int = _container.height;
				if(delta > 0){
					//上,放大
					_container.scaleX *= 1.2;
					_container.scaleY *= 1.2;
				}else if(delta < 0){
					//下,缩小
					_container.scaleX /= 1.2;
					_container.scaleY /= 1.2;
				}
				initContainerPos();
			}
			
			if(InputManager.instance.keyDown(Keyboard.ESCAPE)){
				//esc还原
				_container.scaleX = 1;
				_container.scaleY = 1;
				initContainerPos();
			}
		}
		
		private function __openBtnClick(e:MouseEvent):void
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
		
		private function __loadComplete(e:Event):void
		{
			var loaderInfo:LoaderInfo = e.currentTarget as LoaderInfo;
			loaderInfo.removeEventListener(Event.COMPLETE, __loadComplete);
			var bm:Bitmap = loaderInfo.content as Bitmap;
			
			_background.removeChildren();
			_background.addChild(bm);
			_background.x = (Config.stage.stageWidth - _background.width) / 2;
			_background.y = (Config.stage.stageHeight - _background.height) / 2;
			
			initContainerPos();
		}
		
		override public function show():void{
			UIManager.instance.addChild(this);
		}
	}
}