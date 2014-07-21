package
{
	import com.yo.core.FP;
	import com.yo.core.Game;
	import com.yo.manager.InputManager;
	import com.yo.manager.resource.ResourceManager;
	
	import fl.containers.ScrollPane;
	import fl.controls.Button;
	import fl.controls.ScrollBar;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	[SWF(width="1000", height="600", frameRate="60", backgroundColor="#0")]
	public class UITest extends Game
	{
		public function UITest()
		{
			super();
		}
		
		override protected function loadConfig():void{
			init();
		}
		
		override protected function initManager():void{
			super.initManager();
			
			ResourceManager.instance.setup(null);
			ResourceManager.instance.loadResource("Component", "swf", __loadComponentComplete);
		}
		
		private function __loadComponentComplete(e:Event):void
		{
			InputManager.instance.addEventListener(MouseEvent.CLICK, __clickHandler);
			
//			var panel:ScrollPane = new ScrollPane();
//			this.addChild(panel);
//			
//			var bar:ScrollBar = new ScrollBar();
//			this.addChild(bar);
		}
		
		private function __clickHandler(e:MouseEvent):void
		{
			var len:int = 100;
			for (var i:int = 0; i < len; i++) 
			{
				var btn:Button = new Button();
//				var btn:Sprite = new Sprite();
				this.addChild(btn);
			}
		}
		
		override protected function update():void{
			super.update();
			
			var len:int = this.numChildren;
			for (var j:int = 0; j < len; j++) 
			{
				var btn:Sprite = this.getChildAt(j) as Sprite;
				btn.x = Math.random() * 1000;
				btn.y = Math.random() * 600;
			}
			trace(len);
		}
		
	}
}