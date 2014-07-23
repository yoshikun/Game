package com.yo.framework.manager.state
{
	public interface IStateManager
	{
		function setup(stateCreator:IStateCreator):void;
		
		function update():void;
		
		function changeState(name:String):void;
		
		function get currentState():IState;
	}
}