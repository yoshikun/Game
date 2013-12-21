package scene
{
	import com.yo.logger.Log;
	import com.yo.manager.resource.ResourceManager;
	import com.yo.manager.ui.UIManager;
	
	import flash.display.MovieClip;
	import flash.events.Event;

	public class CityScene extends GameScene
	{
		public function CityScene()
		{
			super();
		}
		
		override public function enter():void{
			super.enter();
			Log.getLog(this).debug("进入主场景");
			ResourceManager.instance.loadResource("boy", "avatar", __loadComplete);
		}
		
		private function __loadComplete(e:Event):void
		{
			var mc:MovieClip = ResourceManager.instance.create("Person") as MovieClip;
			mc.x = 500;
			mc.y = 300;
			UIManager.instance.addChild(mc);
		}
		
		override public function update():void{
			super.update();
		}
		
		override public function exit():void{
			super.exit();
		}
		
		override public function dispose():void{
			super.dispose();
		}
	}
}