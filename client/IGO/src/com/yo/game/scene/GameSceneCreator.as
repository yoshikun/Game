package com.yo.game.scene
{
	import com.yo.framework.manager.scene.IScene;
	import com.yo.framework.manager.scene.SceneCreator;
	import com.yo.framework.scene.GameScene;
	import com.yo.game.enum.SceneName;
	
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
				case SceneName.LOAD_SCENE:
					state = new LoadScene();
					break;
				case SceneName.LOGIN_SCENE:
					state = new LoginScene();
					break;
				case SceneName.CITY_SCENE:
					state = new CityScene();
					break;
				case SceneName.CREATE_ROLE:
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