package scene
{
	import com.yo.logger.Log;
	
	import enum.State;

	public class LoadScene extends GameScene
	{
		public function LoadScene()
		{
			super();
		}
		
		override public function enter():void{
			super.enter();
			Log.getLog(this).debug("进入加载场景");
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