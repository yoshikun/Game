package com.yo.framework.core
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;
	
	public dynamic class DictionaryData extends Dictionary implements IEventDispatcher
	{
		private var _dispatcher:EventDispatcher;
		
		private var _list:Array;
		
		private var _filterName:String;
		
		private var _value:Object;
		
		public function DictionaryData(weakKeys:Boolean=false)
		{
			super(weakKeys);
			
			init();
		}
		
		private function init():void
		{
			_dispatcher = new EventDispatcher(this);
			_list = [];
		}
		
		public function get length():int{
			return _list.length;
		}
		
		public function get list():Array{
			return _list;
		}
		
		public function forEach(callback:Function, thisObject:* = null):void{
			_list.filter(callback);
		}
		
		public function filter(fn:String, v:Object):Array{
			_filterName = fn;
			_value = v;
			return _list.filter(filterCallBack);
		}
		
		/**
		 * item:项值
		 * index:item的序列
		 * array:执行的数组本身 
		 */		
		private function filterCallBack(item:*, index:int, array:Array):Boolean
		{
			return item[_filterName] == _value;
		}
		
		/**
		 * push
		 */		
		public function add(key:*, value:Object):void{
			if(!this[key]){
				this[key] = value;
				_list.push(value);
				dispatchEvent(new DictionaryEvent(DictionaryEvent.ADD, value));
			}else{
				var old:Object = this[key];
				this[key] = value;
				var index:int = _list.indexOf(old);
				if(index > -1)
				{
					_list.splice(index, 1);
				}
				_list.push(value);
				dispatchEvent(new DictionaryEvent(DictionaryEvent.UPDATE, value));
			}
		}
		
		public function remove(key:*):void{
			var value:Object = this[key];
			if(value){
				this[key] = null;
				delete this[key];
				var index:int = _list.indexOf(value);
				if(index > -1)
				{
					_list.splice(index, 1);
				}
				dispatchEvent(new DictionaryEvent(DictionaryEvent.REMOVE, value));
			}
		}
		
		public function shift():*{
			var value:Object = _list.shift();
			for(var key:* in this) 
			{
				if(this[key] == value)
				{
					this[key] = null;
					delete this[key];
				}
			}
			dispatchEvent(new DictionaryEvent(DictionaryEvent.REMOVE, value));
			return value;
		}
		
		public function slice(startIndex:int = 0,endIndex:int = 166777215):Array
		{
			return _list.slice(startIndex,endIndex);
		}
		
		public function concat(arr:Array):Array
		{
			return _list.concat(arr);
		}
		
		public function sort(...args):*
		{
			var temp:Array = _list.sort(args);
			return temp;
		}
		
		public function sortOn(fieldName:Object, options:Object = null):Array
		{
			var temp:Array = _list.sortOn(fieldName,options);
			return temp;
		}
		
		public function reverse():Array{
			return _list.reverse();
		}
		
		public function setData(dic:Dictionary):void{
			clearData();
			for(var key:String in dic)
			{
				this[key] = dic[key];
				_list.push(dic[key]);
			}
		}
		
		public function clear():void{
			clearData();
			dispatchEvent(new DictionaryEvent(DictionaryEvent.CLEAR));
		}
		
		private function clearData():void
		{
			var temp:Array = [];
			for(var i:String in this)
			{
				temp.push(i);
			}
			
			for each(var key:String in temp)
			{
				this[key] = null;
				delete this[key];
			}
			_list = [];
		}
		
		public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
		{
			_dispatcher.addEventListener(type,listener,useCapture,priority,useWeakReference);
		}
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void
		{
			_dispatcher.removeEventListener(type,listener,useCapture);
		}
		
		public function dispatchEvent(event:Event):Boolean
		{
			return _dispatcher.dispatchEvent(event);
		}
		
		public function hasEventListener(type:String):Boolean
		{
			return _dispatcher.hasEventListener(type);
		}
		
		public function willTrigger(type:String):Boolean
		{
			return _dispatcher.willTrigger(type);
		}
	}
}