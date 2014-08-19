package com.yo.framework.utils
{
	import flash.utils.Dictionary;
	
	/**
	 * 具有动态内存管理功能的哈希表。<br/>
	 * 此类通常用于动态共享高内存占用的数据对象，比如BitmapData。
	 * 它类似Dictionary，使用key-value形式来存储数据。
	 * 但当外部对value的所有引用都断开时，value会被GC标记为可回收对象，并从哈希表移除。<br/>
	 * <b>注意：</b>
	 * 只有引用型的value才能启用动态内存管理，若value是基本数据类型(例如String,int等)时，需手动remove()它。
	 * @author DOM
	 */
	public class SharedMap
	{
		/**
		 * 分组大小
		 */                
		private var _groupSize:int = 200;
		
		/**
		 * 添加过的key的总数
		 */                
		private var _totalKeys:int = 0;
		
		/**
		 * key缓存字典
		 */                
		private var _keyDic:Dictionary = new Dictionary();
		
		/**
		 * 上一次的value缓存字典
		 */                
		private var _lastValueDic:Dictionary;
		
		/**
		 * 构造函数
		 * @param groupSize 分组大小,数字越小查询效率越高，但内存占用越高。
		 */                
		public function SharedMap(groupSize:int=200)
		{
			if(groupSize<1)
				groupSize = 1;
			this._groupSize = groupSize;
		}
		
		/**
		 * 通过值获取键
		 * @param value
		 */                
		private function getValueByKey(key:String):*
		{
			var valueDic:Dictionary = _keyDic[key];
			if(!valueDic){
				return null;
			}
				
			var found:Boolean = false;
			var value:*;
			for(value in valueDic)
			{
				if(valueDic[value]===key)
				{
					found = true;
					break;
				}
			}
			if(!found)
			{
				value = null;
				delete _keyDic[key];
			}
			return value;
		}
		
		/**
		 * 设置键值映射
		 * @param key 键
		 * @param value 值
		 */                
		public function set(key:String,value:*):void
		{
			var valueDic:Dictionary = _keyDic[key];
			if(valueDic)
			{
				var oldValue:* = getValueByKey(key);
				if(oldValue!=null){
					delete valueDic[oldValue];
				}
			}else{
				if(_totalKeys%_groupSize==0){
					_lastValueDic = new Dictionary(true);
				}
					
				valueDic = _lastValueDic;
				_totalKeys++;
			}
			if(valueDic[value]!==undefined){
				valueDic = _lastValueDic = new Dictionary(true);
			}
				
			_keyDic[key] = valueDic;
			valueDic[value] = key;
		}
		/**
		 * 获取指定键的值
		 * @param key
		 */                
		public function get(key:String):*
		{
			return getValueByKey(key);
		}
		/**
		 * 检测是否含有指定键
		 * @param key 
		 */                
		public function has(key:String):Boolean
		{
			var valueDic:Dictionary = _keyDic[key];
			if(!valueDic)
				return false;
			var has:Boolean = false;
			for(var value:* in valueDic)
			{
				if(valueDic[value]===key)
				{
					has = true;
					break;
				}
			}
			if(!has){
				delete _keyDic[key];
			}
				
			return has;
		}
		/**
		 * 移除指定的键
		 * @param key 要移除的键
		 * @return 是否移除成功
		 */                
		public function remove(key:String):Boolean
		{
			var value:* = getValueByKey(key);
			if(value==null){
				return false;
			}
				
			var valueDic:Dictionary = _keyDic[key];
			delete _keyDic[key];
			delete valueDic[value];
			return true;
		}
		/**
		 * 获取键名列表
		 */                
		public function get keys():Vector.<String>
		{
			var keyList:Vector.<String> = new Vector.<String>();
			var cacheDic:Dictionary = new Dictionary();
			for(var key:String in _keyDic)
			{
				var valueDic:Dictionary = _keyDic[key];
				if(cacheDic[valueDic]){
					continue;
				}
				cacheDic[valueDic] = true;
				for each(var validKey:String in valueDic)
				{
					keyList.push(validKey);
				}
			}
			return keyList;
		}
		
		/**
		 * 获取值列表
		 */                
		public function get values():Array
		{
			var valueList:Array = [];
			var cacheDic:Dictionary = new Dictionary();
			for(var key:String in _keyDic)
			{
				var valueDic:Dictionary = _keyDic[key];
				if(cacheDic[valueDic]){
					continue;
				}
				cacheDic[valueDic] = true;
				for(var value:* in valueDic)
				{
					valueList.push(value);
				}
			}
			return valueList;
		}
		
		/**
		 * 刷新缓存并删除所有失效的键值。
		 */                
		public function refresh():void
		{
			var keyList:Vector.<String> = keys;
			for(var key:String in _keyDic)
			{
				if(keyList.indexOf(key)==-1){
					delete _keyDic[key];
				}
			}
		}
	}
}