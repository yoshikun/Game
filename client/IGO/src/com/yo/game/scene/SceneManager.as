package com.yo.game.scene
{
	import com.yo.framework.manager.state.StateManager;
	
	public class SceneManager extends StateManager
	{
		private static var _instance:SceneManager;
		
		public function SceneManager(owner:*=null)
		{
			super(owner);
		}

		public static function get instance():SceneManager
		{
			if(!_instance){
				_instance = new SceneManager();
			}
			return _instance;
		}

	}
}