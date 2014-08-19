package com.yo.game.scene
{
	import com.yo.framework.manager.scene.SceneManager;
	
	public class GameSceneManager extends SceneManager
	{
		private static var _instance:GameSceneManager;
		
		public function GameSceneManager()
		{
			super();
		}

		public static function get instance():GameSceneManager
		{
			if(!_instance)
			{
				_instance = new GameSceneManager();
			}
			return _instance;
		}

	}
}