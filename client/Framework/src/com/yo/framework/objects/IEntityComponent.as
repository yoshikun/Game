package com.yo.framework.objects
{
	import com.yo.framework.mvc.interfaces.IDisposable;

	public interface IEntityComponent extends IDisposable
	{
		function get owner():IEntity;
		
		function set owner(value:IEntity):void;
		
		function get name():String;
		
		function get isRegistered():Boolean;

		function register(owner:IEntity, name:String):void;
		
		function unregister():void;
		
		function reset():void;
	}
}