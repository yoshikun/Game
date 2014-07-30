package com.yo.framework.interfaces
{
	import com.yo.framework.mvc.interfaces.IDisposable;
	import com.yo.framework.mvc.interfaces.IUpdateable;
	import com.yo.framework.mvc.interfaces.IVisible;

	public interface IEntityComponent extends IDisposable, IRenderable, IUpdateable, IVisible
	{
		function get entity():IEntity;
		
		function set entity(value:IEntity):void;
		
		function get name():String;
	}
}