package com.yo.mvc.interfaces
{
	public interface IView extends IClearable
	{
		function show():void;
		
		function update():void;
		
		function hide():void;
	}
}