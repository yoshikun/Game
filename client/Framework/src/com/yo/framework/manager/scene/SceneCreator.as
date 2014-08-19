package com.yo.framework.manager.scene
{
	public class SceneCreator implements ISceneCreator
	{
		public function SceneCreator()
		{
			init();
		}
		
		protected function init():void{
			
		}
		
		public function getScene(name:String):IScene
		{
			return null;
		}
		
		public function dispose():void
		{
		}
	}
}