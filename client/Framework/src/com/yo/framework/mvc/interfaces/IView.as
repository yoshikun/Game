package com.yo.framework.mvc.interfaces
{
	public interface IView extends IDisposable
	{
		function show():void;
		
		function update():void;
		
		function hide():void;
	}
}