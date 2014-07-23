package scene
{
	import com.yo.framework.manager.resource.ResourceManager;
	
	import enum.LoaderName;
	import enum.State;
	
	import flash.events.Event;
	
	import manager.SceneManager;
	
	public class LoadScene extends GameScene
	{
		public function LoadScene()
		{
			super();
		}
		
		override public function enter():void{
			super.enter();
			loadResource();
		}
		
		private function loadResource():void
		{
			ResourceManager.instance.addToQueue(LoaderName.PRE_LOAD, "Component", "swf");
			
			ResourceManager.instance.start(LoaderName.PRE_LOAD, __loadComplete);
		}
		
		private function __loadComplete(e:Event):void
		{
			SceneManager.instance.changeState(State.WORK_SCENE);
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