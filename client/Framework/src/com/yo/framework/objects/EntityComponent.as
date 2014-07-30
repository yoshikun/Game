package com.yo.framework.objects
{
	import com.yo.framework.interfaces.IEntity;
	import com.yo.framework.interfaces.IEntityComponent;
	
	import flash.events.EventDispatcher;

	public class EntityComponent extends EventDispatcher implements IEntityComponent
	{
		private var _name:String;
		
		private var _entity:IEntity;
		
		private var _visible:Boolean;
		
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