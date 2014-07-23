package ui
{
	import com.yo.framework.manager.InputManager;
	import com.yo.framework.manager.ui.UIManager;
	import com.yo.framework.mvc.core.BaseView;
	import com.yo.framework.mvc.interfaces.IModel;
	
	import core.Config;
	import core.GlobalEvent;
	import core.GlobalEventDispatcher;
	
	import flash.display.Bitmap;
	import flash.display.BlendMode;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	import iso.DrawnIsoBox;
	import iso.DrawnIsoTile;
	import iso.IsoWorld;
	import iso.Point3D;
	
	import utils.IsoUtils;
	
	public class MapEditorView extends BaseView
	{
		/**
		 * 图片背景
		 */		
		private var _backgroundLayer:Sprite;
		
		/**
		 * 地图数据 
		 */		
		private var _dataLayer:Sprite;
		
		/**
		 * 主容器 
		 */		
		private var _container:Sprite;
		
		private var _world:IsoWorld;
		
		public function MapEditorView(model:IModel=null)
		{
			super(model);
		}
		
		override protected function initView():void{
			_container = new Sprite();
			this.addChild(_container);
			
			_dataLayer = new Sprite();
			_dataLayer.cacheAsBitmap = true;
			_container.addChild(_dataLayer);
			
			_backgroundLayer = new Sprite();
			_dataLayer.addChild(_backgroundLayer);
			
			_world = new IsoWorld(26, 26);
			_dataLayer.addChild(_world);
			
			initWorld();
		}
		
		override protected function initEvent():void{
			super.initEvent();
			
			_world.addEventListener(MouseEvent.MOUSE_DOWN, __worldMouseDown);
			_world.addEventListener(MouseEvent.MOUSE_UP, __worldMouseUp);
			_world.addEventListener(MouseEvent.CLICK, __worldClick);
			
			this.addEventListener(Event.ENTER_FRAME, __enterFrame);
			InputManager.instance.addEventListener(KeyboardEvent.KEY_UP, __keyUp);
			
			Config.stage.addEventListener(Event.MOUSE_LEAVE, __mouseLeave);
			
			GlobalEventDispatcher.addEventListener(GlobalEvent.LOAD_MAP_COMPLETE, __loadComplete);
			GlobalEventDispatcher.addEventListener(GlobalEvent.WALKABLE_CHECKBOX_CLICK, __walkableCheckBoxClick);
		}
		
		private function __walkableCheckBoxClick(e:GlobalEvent):void
		{
			model.walkable = Boolean(e.data);
		}
		
		protected function __mouseLeave(e:Event):void
		{
			__worldMouseUp(null);
		}
		
		private function __keyUp(e:KeyboardEvent):void
		{
			if(e.keyCode == Keyboard.F1){
				model.walkable = !model.walkable;
				GlobalEventDispatcher.dispatchEvent(GlobalEvent.UPDATE_WALKABLE_CHECKBOX, model.walkable);
			}
		}
		
		protected function __worldClick(e:MouseEvent):void
		{
			setWalkable();
		}
		
		private function initWorld():void{
			_world.removeChildren();
			
			for(var i:int = 0; i < _world.cols; i++){
				for (var j:int = 0; j < _world.rows; j++){
					var tile:DrawnIsoTile = new DrawnIsoTile(_world.cellSize, 0xCCCCCC);
					tile.position = new Point3D(i * _world.cellSize, 0, j * _world.cellSize);
					tile.index = i * j;
					
					//输出坐标
					var tf:TextField = new TextField();
					tf.blendMode = BlendMode.LAYER;
					tf.cacheAsBitmap = true;
					tf.selectable = tf.mouseEnabled = tf.border = false;
					tf.autoSize = "center";
					tf.defaultTextFormat = new TextFormat(null,10,0,false,false,false,null,null,"center");
					tf.text = i + "," + j;
					tf.x = -tile.width / 4;
					tf.y = -tile.width / 4;
//					tile.addChild(tf);
					
					_world.addChildToFloor(tile);
					
					model.mapVO.collideList[tile.index] = true;
				}
			}
			
			//将_world居中在自己的容器中
			_world.x = -_world.width / 2 - _world.getBounds(_world).x;
			_world.y = -_world.height / 2 - _world.getBounds(_world).y;
			
			centerMapContainer();
		}
		
		private function centerMapContainer():void
		{
			_container.x = (Config.stage.stageWidth - _container.width) / 2 - _container.getBounds(_container).left * _container.scaleX;
			_container.y = (Config.stage.stageHeight - _container.height) / 2 - _container.getBounds(_container).top * _container.scaleY;
		}
		
		private function __worldMouseDown(e:MouseEvent):void
		{
			_world.addEventListener(MouseEvent.MOUSE_MOVE, __mouseMove);
		}
		
		private function setWalkable():void
		{
			if(InputManager.instance.keyDown(Keyboard.SPACE)){
				return;
			}
			
			var walkable:Boolean = false;
			if(model.walkable){
				walkable = true;
			}
			
			var box:DrawnIsoBox = new DrawnIsoBox(_world.cellSize, 0xFF0000, _world.cellSize);
			var pos:Point3D = IsoUtils.screenToIso(new Point(_world.mouseX, _world.mouseY));
			pos.x = Math.round(pos.x / _world.cellSize) * _world.cellSize;
			pos.y = Math.round(pos.y / _world.cellSize) * _world.cellSize;
			pos.z = Math.round(pos.z / _world.cellSize) * _world.cellSize;
			box.position = pos;
			
			var tile:DrawnIsoTile = _world.getChildByPos(pos) as DrawnIsoTile;
			if(tile){
				tile.walkable = walkable;
				model.mapVO.collideList[tile.index] = walkable;
			}
			
		}
		
		protected function __worldMouseUp(e:MouseEvent):void
		{
			_world.removeEventListener(MouseEvent.MOUSE_MOVE, __mouseMove);
		}
		
		protected function __mouseMove(e:MouseEvent):void
		{
			setWalkable();
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
			
			//鼠标滚轮放大缩小
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
			}
			
			if(InputManager.instance.keyDown(Keyboard.ESCAPE)){
				//esc还原
				_container.scaleX = 1;
				_container.scaleY = 1;
				
				centerMapContainer();
			}
		}
		
		private function __loadComplete(e:GlobalEvent):void
		{
			var bm:Bitmap = e.data as Bitmap;
			
			_backgroundLayer.removeChildren();
			_backgroundLayer.addChild(bm);
			
			//居中背景图
			_backgroundLayer.x = -_backgroundLayer.width / 2;
			_backgroundLayer.y = -_backgroundLayer.height / 2;
			
			//图片的斜边长比小三角的斜边长
			var column:int = Math.ceil((_backgroundLayer.height + _backgroundLayer.width / 2) * Math.atan(30) / (20 * Math.atan(30)));
			_world.cols = _world.rows = Math.max(column, _world.cols);
			
			initWorld();
		}
		
		override public function show():void{
			UIManager.instance.addChild(this);
		}
		
		public function get model():MapEditorModel{
			return _model as MapEditorModel;
		}
	}
}