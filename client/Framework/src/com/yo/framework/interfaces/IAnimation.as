package com.yo.framework.interfaces
{
	import com.yo.framework.mvc.interfaces.IDisposable;
	import com.yo.framework.mvc.interfaces.IUpdateable;

	public interface IAnimation extends IDisposable, IUpdateable
	{
		function set name(value:String):void;
		
		function get name():String;
		
		function play():void;
		
		function pause():void;
		
		function resume():void;
		
		function stop():void;
		
		function end():void;
	}
}