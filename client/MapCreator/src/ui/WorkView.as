package ui
{
	import com.yo.manager.InputManager;
	import com.yo.manager.ui.UIManager;
	import com.yo.mvc.core.BaseView;
	import com.yo.mvc.interfaces.IModel;
	
	import core.Config;
	
	import fl.controls.Button;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	import iso.DrawnIsoBox;
	import iso.DrawnIsoTile;
	import iso.IsoWorld;
	import iso.Point3D;
	
	import utils.IsoUtils;
	
	public class WorkView extends BaseView
	{
		private var _world:IsoWorld;
		
		private var _openBtn:Button;
		
		public function WorkView(model:IModel=null)
		{
			super(model);
		}
		
		override protected function initView():void{
			_openBtn = new Button();
			_openBtn.label = "打开";
			this.addChild(_openBtn);
			
			createWorld();
		}
		
		override protected function initEvent():void{
			super.initEvent();
			
			_openBtn.addEventListener(MouseEvent.CLICK, __openBtnClick);
			this.addEventListener(Event.ENTER_FRAME, __enterFrame);
		}
		
		private function createWorld():void{
			_world = new IsoWorld(20, 20);
			centerWorld();
			
			this.addChild(_world);
			
			for(var i:int = 0; i < _world.cols; i++){
				for (var j:int = 0; j < _world.rows; j++){
					var tile:DrawnIsoTile = new DrawnIsoTile(_world.cellSize, 0xFFFFFF);
					tile.position = new Point3D(i * _world.cellSize, 0, j * _world.cellSize);
					_world.addChildToFloor(tile);
				}
			}
			
			Config.stage.addEventListener(MouseEvent.CLICK, __worldClick);
			Config.stage.addEventListener(Event.RESIZE, __resizeHandler);
		}
		
		private function __resizeHandler(e:Event):void{           
			centerWorld();     
		}
		         
		private function __worldClick(event:MouseEvent):void
		{
			var box:DrawnIsoBox = new DrawnIsoBox(_world.cellSize, Math.random() * 0xffffff, _world.cellSize);
			var pos:Point3D = IsoUtils.screenToIso(new Point(_world.mouseX, _world.mouseY));
			pos.x = Math.round(pos.x / _world.cellSize) * _world.cellSize;
			pos.y = Math.round(pos.y / _world.cellSize) * _world.cellSize;
			pos.z = Math.round(pos.z / _world.cellSize) * _world.cellSize;
			box.position = pos;
			_world.addChildToWorld(box);
		}
		
		private function centerWorld():void
		{
			_world.x = Config.stage.stageWidth / 2; 
			_world.y = Config.stage.stageHeight / 2;
		}
		
		protected function __enterFrame(e:Event):void
		{
			//可以拖动
			if(InputManager.instance.keyDown(Keyboard.SPACE)){
				Mouse.cursor = MouseCursor.HAND;
				
				if(InputManager.instance.mouseDown()){
					_world.startDrag();
				}else{
					_world.stopDrag();
				}
			}else{
				Mouse.cursor = MouseCursor.AUTO;
				_world.stopDrag();
			}
			
			if(InputManager.instance.mouseWheel){
				var delta:int = InputManager.instance.mouseWheelDelta;
				if(delta > 0){
					//上,放大
					_world.scaleX *= 1.2;
					_world.scaleY *= 1.2;
				}else if(delta < 0){
					//下,缩小
					_world.scaleX /= 1.2;
					_world.scaleY /= 1.2;
				}
			}
			
			if(InputManager.instance.keyDown(Keyboard.ESCAPE)){
				//esc还原
				centerWorld();
				_world.scaleX = 1;
				_world.scaleY = 1;
			}
		}
		
		private function __openBtnClick(e:MouseEvent):void
		{
			var file:File = new File();
			file.browse();
		}
		
		override public function show():void{
			UIManager.instance.addChild(this);
		}
	}
}