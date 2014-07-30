package com.yo.framework.interfaces
{
	import com.yo.framework.mvc.interfaces.IUpdateable;
	import com.yo.framework.objects.RenderState;
	
	import flash.geom.Point;

	public interface IEntity extends IGameObject, IUpdateable, IRenderable
	{
		function addComponent(component:IEntityComponent):void;
		
		function removeComponent(component:IEntityComponent):void;
		
		function getRenderState():RenderState;
	}
}
