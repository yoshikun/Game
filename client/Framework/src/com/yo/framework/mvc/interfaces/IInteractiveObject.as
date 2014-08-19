package com.yo.framework.mvc.interfaces
{
	import flash.ui.ContextMenu;
	
	public interface IInteractiveObject extends IDisplayObject
	{
		function get contextMenu():ContextMenu;
		function set contextMenu(value:ContextMenu):void;
		function get doubleClickEnabled():Boolean;
		function set doubleClickEnabled(value:Boolean):void;
		function get focusRect():Object;
		function set focusRect(value:Object):void;
		function get mouseEnabled():Boolean;
		function set mouseEnabled(value:Boolean):void;
		function get tabEnabled():Boolean;
		function set tabEnabled(value:Boolean):void;
		function get tabIndex():int;
		function set tabIndex(value:int):void
	}
}