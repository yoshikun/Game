package com.yo.framework.objects.event
{
	import flash.events.Event;
	
	public class EntityEvent extends Event
	{
		/**
		 * 发送移动请求 
		 */		
		public static const ENTITY_MOVE_REQUEST:String = "entity_move_request";
		
		public static const HIT:String = "hit";
		
		public static const REMOVED:String = "remove";
		
		public static const OWNER_ENTER_DOOR:String = "owner_enter_door";
		
		public static const INVISIBLE:String = "invisible";
		
		public static const DEAD:String = "dead";
		
		public var data:Object;
		
		public function EntityEvent(type:String, data:Object = null)
		{
			this.data = data;
			super(type, bubbles, cancelable);
		}
	}
}