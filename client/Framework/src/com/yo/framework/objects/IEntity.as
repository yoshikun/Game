package com.yo.framework.objects
{
	public interface IEntity extends IGameObject
	{
		function addComponent(component:IEntityComponent):void;
		
		function removeComponent(component:IEntityComponent):void;
	}
}
