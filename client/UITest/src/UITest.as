package
{
	import com.yo.core.Game;
	import com.yo.manager.resource.ResourceManager;
	
	import flash.events.Event;
	
	import fl.containers.ScrollPane;
	import fl.controls.Button;
	import fl.controls.ScrollBar;
	
	[SWF(width="1000", height="600", frameRate="60", backgroundColor="#0")]
	public class UITest extends Game
	{
		public function UITest()
		{
			super();
		}
		
		override protected function initManager():void{
			super.initManager();
			
			ResourceManager.instance.setup(null);
			ResourceManager.instance.loadResource("Component", "swf", __loadComponentComplete);
		}
		
		private function __loadComponentComplete(e:Event):void
		{
			var btn:Button = new Button();
			this.addChild(btn);
			
			var panel:ScrollPane = new ScrollPane();
			this.addChild(panel);
			
			var bar:ScrollBar = new ScrollBar();
			this.addChild(bar);
		}
	}
}