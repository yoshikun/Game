package com.yo.game.scene
{
	import com.yo.framework.manager.scene.IScene;
	import com.yo.framework.manager.scene.SceneCreator;
	import com.yo.framework.scene.GameScene;
	import com.yo.game.enum.Scene;
	
	public class GameSceneCreator extends SceneCreator
	{
		public function GameSceneCreator()
		{
			
		}
		
		override protected function init():void{
			
		}
		
		override public function getScene(name:String):IScene{
			var state:GameScene;
			switch(name)
			{
				case Scene.LOAD_SCENE:
					state = new LoadScene();
					break;
				case Scene.LOGIN_SCENE:
					state = new LoginScene();
					break;
				case Scene.CITY_SCENE:
					state = new CityScene();
					break;
				case Scene.CREATE_ROLE:
					state = new CreateRoleScene();
					break;
				default:
					break;
			}
			if(state){
				state.name = name;
			}
			return state;
		}
		
		override public function dispose():void
		{
		}
	}
}