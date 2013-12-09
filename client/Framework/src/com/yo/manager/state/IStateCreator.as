package com.yo.manager.state
{
	import com.yo.mvc.interfaces.IClearable;

	public interface IStateCreator extends IClearable
	{
		function getState(name:String):IState;
	}
}