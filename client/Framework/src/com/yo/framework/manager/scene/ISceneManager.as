package com.yo.framework.manager.scene
{
	public interface ISceneManager
	{
		function setup(stateCreator:ISceneCreator):void;
		
		function update():void;
	}
}