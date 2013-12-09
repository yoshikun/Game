package scene
{
	import com.yo.manager.resource.ResourceManager;
	
	import core.URLCreator;
	
	import enum.State;

	public class LoadScene extends GameScene
	{
		public function LoadScene()
		{
			super();
		}
		
		override public function enter():void{
			super.enter();
			
			ResourceManager.instance.setup(new URLCreator());
			
			SceneManager.instance.changeState(State.CITY_SCENE);
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