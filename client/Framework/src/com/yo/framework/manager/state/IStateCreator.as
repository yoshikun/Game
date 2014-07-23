package com.yo.framework.manager.state
{
	import com.yo.framework.mvc.interfaces.IClearable;

	public interface IStateCreator extends IClearable
	{
		function getState(name:String):IState;
	}
}