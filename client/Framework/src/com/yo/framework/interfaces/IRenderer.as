package com.yo.framework.interfaces
{
	import com.yo.framework.mvc.interfaces.IDisplayObject;
	import com.yo.framework.mvc.interfaces.IDisposable;

	public interface IRenderer extends IDisplayObject, IDisposable, IRenderable
	{
		function get entity():IEntity;
		
		function set entity(value:IEntity):void;
		
		function get animator():IAnimator;
	}
}