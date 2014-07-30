package com.yo.framework.ai.FSM
{
	public interface IState
	{
		function enter(owner:*):void;
		
		function execute():void;
		
		function exit():void; 
		
	}
}