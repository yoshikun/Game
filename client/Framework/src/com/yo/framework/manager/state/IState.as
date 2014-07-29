package com.yo.framework.manager.state
{
	import com.yo.framework.mvc.interfaces.IDisposable;

	public interface IState extends IDisposable
	{
		function enter():void;

		function update():void;
		
		function exit():void;
		
		function get name():String;
		
		function set name(value:String):void;
	}
}