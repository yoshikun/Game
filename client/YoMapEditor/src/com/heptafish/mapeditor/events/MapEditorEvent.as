package com.heptafish.mapeditor.events
{
	import flash.events.Event;
	
	public class MapEditorEvent extends Event
	{
		public static const MAP_INFO_CHNAGE:String = "map_info_chnage";
		
		public static const NEW_IMAGELIB_SUBMIT:String = "new_imagelib_submit";
		
		public static const EDIT_BUILD_SUBMIT:String = "edit_build_submit";
		
		public var data:Object;
		
		public function MapEditorEvent(type:String, data:Object = null)
		{
			this.data = data;
			super(type, false, false);
		}
	}
}