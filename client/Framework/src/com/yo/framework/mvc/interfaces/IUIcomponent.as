package com.yo.framework.mvc.interfaces
{
	import flash.display.InteractiveObject;
	
	public interface IUIcomponent extends ISprite
	{
		function get enabled():Boolean;
		function set enabled(value:Boolean):void;
		function get focusEnabled():Boolean;
		function set focusEnabled(value:Boolean):void;
		function get mouseFocusEnabled():Boolean;
		function set mouseFocusEnabled(value:Boolean):void;
		
		function clearStyle(style:String):void;
		function drawFocus(focused:Boolean):void;
		function drawNow():void;
		function getFocus():InteractiveObject;
		function getStyle(style:String):Object;
		function invalidate(property:String, callLater:Boolean = true):void;
		function move(x:Number, y:Number):void;
		function setFocus():void;
		function setSize(width:Number, height:Number):void;
		function setStyle(style:String, value:Object):void;
		function validateNow():void;
	}
}