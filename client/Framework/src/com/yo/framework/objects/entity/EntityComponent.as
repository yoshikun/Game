package com.yo.framework.objects.entity
{
	import com.yo.framework.interfaces.IEntity;
	import com.yo.framework.interfaces.IComponent;
	
	import flash.events.EventDispatcher;

	public class EntityComponent extends EventDispatcher implements IComponent
	{
		protected var _name:String;
		
		protected var _entity:IEntity;
		
		protected var _visible:Boolean;
		
		public function EntityComponent()
		{
			
		}
		
		public function update():void
		{
			
		}
		
		public function render():void
		{
			
		}
		
		public function get entity():IEntity
		{
			return _entity;
		}
		
		public function set entity(value:IEntity):void
		{
			_entity = value;
		}
		
		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}

		public function dispose():void
		{
			
		}

		public function get visible():Boolean
		{
			return _visible;
		}

		public function set visible(value:Boolean):void
		{
			_visible = value;
		}

	}
}