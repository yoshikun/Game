package com.yo.framework.interfaces
{
	import com.yo.framework.mvc.interfaces.IDisposable;

	public interface IAnimation extends IDisposable
	{
		function play():void;
		
		function pause():void;
		
		function resume():void;
		
		function stop():void;
		
		function end():void;
	}
}