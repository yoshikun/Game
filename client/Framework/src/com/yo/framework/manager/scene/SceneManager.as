package com.yo.framework.manager.scene
{
	import com.yo.framework.ai.FSM.IState;
	import com.yo.framework.manager.scene.IScene;
	import com.yo.framework.manager.scene.ISceneCreator;
	import com.yo.framework.manager.scene.ISceneManager;

	/**
	 * 场景状态管理
	 */	
	public class SceneManager implements ISceneManager
	{
		protected var _sceneCreator:ISceneCreator;
		
		protected var _currentScene:IScene;
		
		public function SceneManager()
		{
		}
		
		public function setup(stateCreator:ISceneCreator):void{
			_sceneCreator = stateCreator;
		}
		
		public function update():void
		{
			if(_currentScene)
			{
				_currentScene.update();
			}
		}
		
		public function changeScene(name:String):void
		{
			if(!_sceneCreator)
			{
				return;
			}
			var nextScene:IScene = _sceneCreator.getScene(name);
			
			if(!nextScene || nextScene == _currentScene)
			{
				return;
			}
			
			if(_currentScene)
			{
				_currentScene.exit();
				_currentScene = null;
			}
			
			_currentScene = nextScene;
			_currentScene.enter();
		}

		public function get currentScene():IScene
		{
			return _currentScene;
		}
	}
}