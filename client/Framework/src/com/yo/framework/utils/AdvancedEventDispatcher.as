package com.yo.framework.utils
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;
	
	
	/**
	 * 增加全部清理事件监听版的事件派发器 
	 * @author Dalton
	 * 
	 */	
	public class AdvancedEventDispatcher extends EventDispatcher
	{
		private var _map:Dictionary	= new Dictionary();
		private var _mapCapture:Dictionary = new Dictionary();
		
		public function AdvancedEventDispatcher(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		 * 增加事件监听 
		 * @param type
		 * @param listener
		 * @param useCapture
		 * @param priority
		 * @param useWeakReference
		 * 
		 */		
		override public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false) : void
		{
			super.addEventListener(type, listener, useCapture, priority, useWeakReference);
			
			if (useCapture) {
				if (_mapCapture[type]) {
					if(_mapCapture[type][listener])
						return;
					_mapCapture[type][listener]	= new $Listener(type , listener , useCapture , priority , useWeakReference);
				} else {
					_mapCapture[type] = new Dictionary();
					_mapCapture[type][listener]	= new $Listener(type , listener , useCapture , priority , useWeakReference);
				}
			}
			else {
				if (_map[type]) {
					if(_map[type][listener])
						return;
					_map[type][listener] = new $Listener(type , listener , useCapture , priority , useWeakReference);
				} else {
					_map[type] = new Dictionary();
					_map[type][listener] = new $Listener(type , listener , useCapture , priority , useWeakReference);
				}
			}
		}
		
		/**
		 * 移除事件监听
		 * @param type
		 * @param listener
		 * @param useCapture
		 * 
		 */		
		override public function removeEventListener(type:String, listener:Function, useCapture:Boolean=false) : void
		{
			super.removeEventListener(type, listener, useCapture);
			
			if (useCapture) {
				if(_mapCapture[type] && _mapCapture[type][listener])
					delete _mapCapture[type][listener];
			}
			else {
				if(_map[type] && _map[type][listener])
					delete _map[type][listener];
			}
		}
		
		/**
		 * 移除所有的事件监听
		 */
		public final function removeAllEventListener():void
		{
			for(var typec:* in _mapCapture) {
				for(var lc:* in _mapCapture[typec])
					removeEventListener(typec, lc, true);
			}
			
			for(var type:* in _map) {
				for(var l:* in _map[type])
					removeEventListener(type, l, false);
			}
		}
		
		/**
		 * 移除指定事件的所有监听
		 */
		public final function removeEventListenerByType(type:String):Array
		{
			var result:Array = new Array();
			
			if (_mapCapture[type]) {
				for(var lc:* in _mapCapture[type])
				{
					result.push(_mapCapture[type][lc]);
					removeEventListener(type, lc, true);
				}
			}
			
			if (_map[type]) {
				for(var l:* in _map[type]) {
					result.push(_map[type][l]);
					removeEventListener(type, l, false);
				}
			}
			
			return result;
		}
	}
}

class $Listener
{
	public var type:String;
	public var listener:Function;
	public var useCapture:Boolean;
	public var priority:int;
	public var useWeakReference:Boolean;
	
	public function $Listener(type:String, listener:Function, useCapture:Boolean, priority:int, useWeakReference:Boolean)
	{
		this.type = type;
		this.listener = listener;
		this.useCapture	= useCapture;
		this.priority =	priority;
		this.useWeakReference = useWeakReference;
	}
}