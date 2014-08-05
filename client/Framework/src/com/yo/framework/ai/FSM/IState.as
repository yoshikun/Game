package com.yo.framework.ai.FSM
{
	public interface IState
	{
		function enter(owner:* = null):void;
		
		function excute():void;
		
		function exit():void; 
	}
}