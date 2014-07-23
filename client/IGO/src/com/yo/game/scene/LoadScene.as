package com.yo.game.scene
{
	import com.yo.game.enum.State;

	public class LoadScene extends GameScene
	{
		public function LoadScene()
		{
			super();
		}
		
		override public function enter():void{
			super.enter();
			SceneManager.instance.changeState(State.CREATE_ROLE);
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