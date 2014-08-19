package com.yo.framework.manager.scene
{
	import com.yo.framework.ai.FSM.IState;
	import com.yo.framework.mvc.interfaces.IDisposable;

	public interface ISceneCreator extends IDisposable
	{
		function getScene(name:String):IScene;
	}
}