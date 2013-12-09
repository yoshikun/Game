package com.yo.manager.state
{
	import com.yo.mvc.interfaces.IClearable;

	public interface IState extends IClearable
	{
		function enter():void;

		function update():void;
		
		function exit():void;
	}
}