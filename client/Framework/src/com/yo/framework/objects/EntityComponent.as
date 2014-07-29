package com.yo.framework.objects
{
	public class EntityComponent implements IEntityComponent
	{
		private var _name:String;
		
		private var _entity:IEntity;
		
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

	}
}