package com.yo.framework.manager.state
{
	import com.yo.framework.mvc.interfaces.IDisposable;

	public interface IStateCreator extends IDisposable
	{
		function getState(name:String):IState;
	}
}