package com.yo.framework.interfaces
{
	import com.yo.framework.mvc.interfaces.IUpdateable;
	import com.yo.framework.objects.RenderState;
	
	import flash.geom.Point;

	public interface IEntity extends IGameObject, IUpdateable, IRenderable
	{
		function addComponent(component:IComponent):void;
		
		function removeComponent(component:IComponent):void;
		
		function getRenderState():RenderState;
	}
}
