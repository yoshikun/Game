package com.yo.game.data.cache.decoder
{
	import br.com.stimuli.loading.loadingtypes.LoadingItem;
	
	import com.yo.framework.core.DictionaryData;
	import com.yo.framework.logger.Log;
	import com.yo.framework.manager.resource.ResourceManager;
	import com.yo.game.core.Global;
	import com.yo.game.core.GlobalEvent;
	import com.yo.game.core.GlobalEventDispatcher;
	import com.yo.game.enum.LoaderName;
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	import flash.utils.Endian;

	public class XMLDecoder implements IXMLDecoder
	{
		protected var _data:DictionaryData;
		
		public function XMLDecoder()
		{
			init();
		}
        
		protected function init():void{
			initModel();
		}
		
		protected function initModel():void
		{
			_data = new DictionaryData();
		}
		
		public function load():void {
			var resource:* = ResourceManager.instance.getResource(name, resourceType, LoaderName.PRE_LOAD);
			if(resource)
			{
				ResourceManager.instance.decodeList.push(this);
			}
			else
			{
				ResourceManager.instance.addToQueue(LoaderName.PRE_LOAD, name, resourceType, __itemLoadComplete);
			}
		}
		public function decode():void{
			if(Global.encrypt)
			{
				var bytes:ByteArray = ResourceManager.instance.getResource(name, resourceType, LoaderName.PRE_LOAD) as ByteArray;
				bytes.position = 0;
				bytes.endian = Endian.LITTLE_ENDIAN;
				var readList:Object = bytes.readObject();
				for each (var object:Object in readList)
				{
					decodeObjectToData(object);
				}
			}
			else
			{
				var resource:* = ResourceManager.instance.getResource(name, resourceType, LoaderName.PRE_LOAD);
				var xml:XML =  new XML(resource);
				if(xml)
				{
					var xmlList:XMLList = xml.children();
					var len:int = xmlList.length();
					for(var i:int = 0; i < len; i++)
					{
						var xmlChild:XML = xmlList[i];
						addToData(xmlChild);	
					}
				}
			}
			ResourceManager.instance.removeResource(name, resourceType);
			
			var item:LoadingItem = ResourceManager.instance.getLoadingItem(name, resourceType, LoaderName.PRE_LOAD);
			if(item)
			{
				item.destroy();
			}
			
			GlobalEventDispatcher.dispatchEvent(GlobalEvent.DECODE_COMPLETE);
		}
		
		protected function decodeObjectToData(object:Object):void{
			var itemBaseData:* = creatItemBaseData();
			itemBaseData.copyFrom(object);
			_data.add(itemBaseData.baseID, itemBaseData);
		}
		
		protected function addToData(xml:XML):void{
			var itemBaseData:* = creatItemBaseData();
			
			if(xml.name() == "GlobalConfig"){
				var xmlList:XMLList = xml.children();
				for each (var item:XML in xmlList) 
				{
					var itemName:String = item.name();
					if(itemBaseData.hasOwnProperty(itemName)){
						itemBaseData[itemName] = xml[itemName].toString();
					}else{
						if(xml.name() != "GlobalConfig"){
							Log.getLog(this).debug(xml.name() + "未找到属性" + itemName);
						}
					}
				}
			}else{
				itemBaseData.copyFrom(xml);
			}
			_data.add(itemBaseData.baseID, itemBaseData);
		}
		
		protected function creatItemBaseData():*{
			return null;
		}
		
		protected function __itemLoadComplete(e:Event):void{
			var item:LoadingItem = e.currentTarget as LoadingItem;
			item.removeEventListener(Event.COMPLETE, __itemLoadComplete);
			
			ResourceManager.instance.decodeList.push(this);
		}
		
		public function get data():DictionaryData
		{
			return _data;
		}
		
		public function set data(value:DictionaryData):void
		{
			_data = value;
		}

		public function get name():String
		{
			return "";
		}

		public function get resourceType():String
		{
			return "";
		}

	}
}