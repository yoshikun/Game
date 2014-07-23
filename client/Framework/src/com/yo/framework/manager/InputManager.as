package com.yo.framework.manager
{
	import flash.display.InteractiveObject;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	import mx.utils.ArrayUtil;
	
	/**
	 * 这个类可以得到所有的输入信息，如键盘键入信息，鼠标位置信息等
	 */
	public class InputManager
	{
		public var keysHit:Array;
		public var keyStatus:Array;
		
		private var _mouseX:int;
		private var _mouseY:int;
		private var _mouseStatus:int;
		private var _mouseButtonHit:int;
		
		private var _mouseWheel:Boolean;
		private var _mouseWheelDelta:int;
		
		public var last:FocusEvent;
		
		private var _area:InteractiveObject;
		
		public static var instance:InputManager = new InputManager();
		
		public function InputManager() 
		{
		}
		
		public function setup(area:InteractiveObject):void 
		{
			_area = area;
			
			keyStatus = [];
			keysHit = [];
			
			_area.addEventListener(MouseEvent.MOUSE_WHEEL, __mouseWheel);
			_area.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			_area.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			_area.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			_area.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			_area.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			_area.addEventListener(flash.events.FocusEvent.FOCUS_OUT, focusOutHandler);
			_area.addEventListener(flash.events.FocusEvent.KEY_FOCUS_CHANGE, focusOutHandler);
			_area.addEventListener(flash.events.FocusEvent.MOUSE_FOCUS_CHANGE, focusOutHandler);
		}
		
		private function __mouseWheel(e:MouseEvent):void
		{
			_mouseWheel = true;
			_mouseWheelDelta = e.delta;
		}
		
		public function get mouseWheelDelta():int
		{
			if(_mouseWheel){
				_mouseWheel = false;
				return _mouseWheelDelta;
			}
			return 0;
		}
		
		public function get mouseWheel():Boolean{
			return _mouseWheel;
		}
		
		public function addEventListener(type:String, listener:Function):void{
			_area.addEventListener(type, listener);
		}
		
		public function removeEventListener(type:String, listener:Function):void{
			_area.removeEventListener(type, listener);
		}
		
		public function keyDownHandler(e:KeyboardEvent):void
		{
			keyStatus[e.keyCode] = true;
			keysHit[e.keyCode] = true;
		}
		
		public function keyUpHandler(e:KeyboardEvent):void
		{
			keyStatus[e.keyCode] = false;
		}
		
		public function mouseDownHandler(e:MouseEvent):void
		{
			_mouseStatus = 1;
			_mouseButtonHit = 1;
		}
		
		public function mouseUpHandler(e:MouseEvent):void
		{
			_mouseStatus = 0;
		}
		
		public function mouseMoveHandler(e:MouseEvent):void
		{
			_mouseX = e.stageX;
			_mouseY = e.stageY;
		}
		
		public function focusOutHandler(e:flash.events.FocusEvent):void
		{
			var keyStatusCount:uint = 0;
			if(last)
			{
				if(e.type == flash.events.FocusEvent.FOCUS_OUT)
				{
					if(last.type != flash.events.FocusEvent.MOUSE_FOCUS_CHANGE)
					{
						keyStatusCount = 0;
						while(keyStatusCount < keyStatus.length) 
						{
							keyStatus[keyStatusCount] = false;
							++keyStatusCount;
						}
						_mouseStatus = 0;
					}
				}
			}
			last = e;
		}
		
		public function mouseX():int
		{
			return _mouseX;
		}
		
		public function mouseY():int
		{
			return _mouseY;
		}
		
		public function keyDown(key:int):int
		{
			return keyStatus[key];
		}
		
		public function keyDownArray(keyArray:Array, except:Object = null):Boolean
		{
			// 复制数组
			var keyArray:Array = keyArray.slice();
			if(except){
				keyArray.splice(ArrayUtil.getItemIndex(except, keyArray), 1);
			}
			var status:Boolean = true;
			for each(var key:int in keyArray){
				status = keyStatus[key];
				if(! status){
					return status;
				}
			}
			return status;
		}
		
		public function clear():void{
			keyStatus = [];
			keysHit = [];
		}
		
		public function mouseDown():int
		{
			return _mouseStatus;
		}
		
		public function keyHit(key:int, keyup:Boolean = true):int
		{
			var status:int;
			status = keysHit[key];
			if(keyup)
			{
				keysHit[key] = false;
			}
			return status;
		}
		
		public function mouseHit():int
		{
			var mouseHitStatus:int = _mouseButtonHit;
			_mouseButtonHit = 0;
			return mouseHitStatus;
		}
		
	}
	
}