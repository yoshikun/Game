package com.yo.framework.manager.resource
{
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.loadingtypes.LoadingItem;
	
	import flash.events.Event;
	import flash.system.ApplicationDomain;
	import flash.system.Capabilities;
	import flash.system.LoaderContext;
	import flash.system.SecurityDomain;
	import flash.utils.Dictionary;
	
	public class ResourceManager
	{
		private static var _instance:ResourceManager;
		
		/**
		 * 内嵌库数组 
		 */
		private var _resources:Dictionary = new Dictionary();
		
		/**
		 * 资源路径配置 
		 */		
		private var _url:Dictionary = new Dictionary();
		
		/**
		 * 应用程序域 
		 */	
		private var _domain:ApplicationDomain;

		/**
		 * 应用程序 上下文 
		 */
		private var _context:LoaderContext;
		
		/**
		 * 上下文列表 
		 */		
		private var _contexts:Dictionary = new Dictionary();
		
		/**
		 * 解析数据列表 
		 */		
		public var decodeList:Array = [];
		
		public function ResourceManager()
		{
		}

		public function setup(urlCreator:IURLCreator):void
		{
			_domain = ApplicationDomain.currentDomain;
			_context = new LoaderContext(true, _domain);
			
			//在浏览器插件中运行
			if(Capabilities.playerType == "Plugin") {
				_context.securityDomain = SecurityDomain.currentDomain;
			}
		}
		
		/**
		 * 设置资源URL 
		 */        
		public function setUrl(key:String, url:Object):void{
			_url[key] = url;
		}
		
		/**
		 * 加载单个资源 
		 */        
		public function loadResource(resourceName:String, resourceType:String, itemLoadComplete:Function = null, context:* = null):void{
			var loaderName:String = resourceName;
			addToQueue(loaderName, resourceName, resourceType, itemLoadComplete, context);
			start(loaderName);
		}
		
		/**
		 * 加入加载队列 
		 */        
		public function addToQueue(loaderName:String, resourceName:String, resourceType:String, itemLoadComplete:Function = null, context:* = null):void{
			var loader:BulkLoader = getLoader(loaderName);
			addLoadingItem(loader, resourceName, resourceType, itemLoadComplete, context);
		}
		
		/**
		 * 开始队列加载
		 */		
		public function start(loaderName:String, loadComplete:Function = null):void{
			var loader:BulkLoader = getLoader(loaderName);
			if(!loader.isRunning)
			{
				loader.start();
			}
			
			loader.addEventListener(BulkLoader.COMPLETE, onAllComplete(loader, loadComplete));
			if(loader._isAllDoneP())
			{
				loader.dispatchEvent(new Event(BulkLoader.COMPLETE));
			}
		}
		
		/**
		 * 全部加载完成
		 */		
		private function onAllComplete(loader:BulkLoader, callback:Function):Function{
			return function(e:Event):void{
				if (callback != null)
				{
					callback(e);
				}
				loader.removeEventListener(BulkLoader.COMPLETE, arguments.callee);
			}
		}
		
		/**
		 * 获取loader
		 */		
		public function getLoader(loaderName:String):BulkLoader{
			var loader:BulkLoader = BulkLoader.getLoader(loaderName);
			if(!loader)
			{
				loader = new BulkLoader(loaderName);
			}
			return loader;
		}
		
		/**
		 * 获取资源 
		 */        
		public function getResource(resourceName:String, resourceType:String, loaderName:String = ""):*{
			if(loaderName == "")
			{
				loaderName = resourceName;
			}
			var id:String = getResourceId(resourceName, resourceType);
			var loader:BulkLoader = getLoader(loaderName);
			var resource:* = loader.getContent(id);
			return resource;
		}
		
		/**
		 * 获取loader内部资源 
		 */        
		public function getLoadingItem(resourceName:String, resourceType:String, loaderName:String = ""):LoadingItem
		{
			if(loaderName == "")
			{
				loaderName = resourceName;
			}
			var loader:BulkLoader = getLoader(loaderName);
			var item:LoadingItem;
			if(loader)
			{
				var id:String = getResourceId(resourceName, resourceType);
				item = loader.get(id);
			}
			return item;
		}
		
		/**
		 * 加入队列
		 */		
		private function addLoadingItem(loader:BulkLoader, resourceName:String, resourceType:String, itemLoadComplete:Function = null, context:* = null):void
		{
			//获得资源标示符
			var id:String = getResourceId(resourceName, resourceType);
			//获取资源配置路径
			var url:String = getResourceUrl(resourceName, resourceType);
			
			var props:Object ={"id": id, "context": context ? context : _context};
			
			var type:String = getResourceType(resourceName, resourceType);
			if(type){
				props.type = type;
			}
			//加入加载器
			var item:LoadingItem = loader.add(url, props);
			
			//单个加载完成
			item.addEventListener(Event.COMPLETE, onItemComplete(item, itemLoadComplete));
			
			if(item.isLoaded){
				item.dispatchEvent(new Event(Event.COMPLETE));
			}
		}
		
		private function onItemComplete(item:LoadingItem, callback:Function):Function{
			return function(e:Event):void{
				if(callback != null){
					callback(e);
				}
				item.removeEventListener(Event.COMPLETE, arguments.callee);
			}
		}
		
		public function removeResource(resourceName:String, resourceType:String):void{
			var id:String = getResourceId(resourceName, resourceType);
			delete _resources[id];
		}
		
		/**
		 * 设置资源 
		 */        
		public function setResource(resourceName:String, resourceType:String, resource:Object):void{
			var id:String = getResourceId(resourceName, resourceType);
			_resources[id] = resource;
		}
		
		/**
		 * 获取资源唯一标示符 
		 */        
		private function getResourceId(resourceName:String, resourceType:String):String{
			return "com.yo.resource." + resourceType + "." + resourceName;
		}
		
		/**
		 * 获取资源存在路径 
		 */        
		public function getResourceUrl(name:String, resourceType:String):String
		{
			var config:Object = _url[resourceType];
			var url:String;
			if(!config){
				url = name + "." + resourceType;
			}else{
				url = config.path + name + config.extension;
			}
			url += url.indexOf("?") == -1 ? "?" : "&";
			url += "v=" + Math.random();
			return url;
		}
		
		/**
		 * 获取资源类型
		 */        
		private function getResourceType(name:String, resourceType:String):String
		{
			var config:Object = _url[resourceType];
			if(!config){
				return null;
			}
			return config.type;
		}
		
		/**
		 * 获取上下文 
		 */        
		public function getContext(name:String):LoaderContext{
			var context:LoaderContext = _contexts[name];
			if (!context){
				context = createContext();
				_contexts[name] = context;
			}
			return context;
		}
		
		/**
		 * 创建上下文 
		 */		
		public function createContext():LoaderContext{
			var context:LoaderContext = new LoaderContext(false, new ApplicationDomain(ApplicationDomain.currentDomain));
			context.allowCodeImport = true;
			
			if(Capabilities.playerType == "Plugin") {
				context.securityDomain = SecurityDomain.currentDomain;
			}
			return context;
		}
		
		public function create(name:String):Object
		{
			try
			{
				if(_domain.hasDefinition(name))
				{
					var cls:Class = _domain.getDefinition(name) as Class;
					var o:Object = new cls();
					return o;
				}
			}
			catch(err:Error)
			{
				
			}
			return null;
		}
		
		private function hasDefinition(name:String):Boolean
		{
			return _domain.hasDefinition(name);
		}
		
		public function getDefinition(name:String):Object
		{
			try
			{
				if(_domain.hasDefinition(name))
				{
					var temp:Object = _domain.getDefinition(name);
					return temp;
				}
			}
			catch(err:Error)
			{
				
			}
			return null;
		}
		
		/**
		 * 清理加载器 
		 */        
		public function clearLoader(name:String):void{
			var loader:BulkLoader = BulkLoader.getLoader(name);
			if(loader)
			{
				loader.clear();
			}
		}
		
		public static function get instance():ResourceManager{
			if(!_instance)
			{
				_instance = new ResourceManager();
			}
			return _instance;
		}
	}
}