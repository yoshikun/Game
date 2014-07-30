package com.yo.framework.interfaces
{
	import flash.display.Sprite;
	import flash.geom.Rectangle;

	public interface IEntityContainer
	{
		function addEntity(e:IEntity):void;
		
		function removeEntity(e:IEntity):void;
		
        function set bound(rect:Rectangle):void;
		
        function get bound():Rectangle;
	}
}