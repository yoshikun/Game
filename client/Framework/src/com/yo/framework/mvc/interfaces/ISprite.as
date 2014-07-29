package com.yo.framework.mvc.interfaces
{
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.media.SoundTransform;
	
	public interface ISprite extends IDisplayContainer, IDisposable
	{
		function get buttonMode():Boolean;
		function set buttonMode(value:Boolean):void;
		function get dropTarget():DisplayObject;
		function get graphics():Graphics;
		function get hitArea():Sprite;
		function get soundTransform():SoundTransform;
		function set soundTransform(value:SoundTransform):void;
		function get useHandCursor():Boolean;
		function set useHandCursor(value:Boolean):void;
		
		function startDrag(lockCenter:Boolean = false, bounds:Rectangle = null):void;
		function stopDrag():void;
	}
}