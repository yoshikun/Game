package com.yo.framework.manager.ui
{
	import com.yo.framework.manager.layer.GameLayer;
	import com.yo.framework.manager.layer.LayerManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	/**
	 * UI管理
	 */	
	public class UIManager
	{
		private static var _instance:UIManager;
		
		public static const BELLOW:int = 0;
		
		public static const MIDDLE:int = 1;
		
		public static const ABOVE:int = 2;
		
		private const COUNT:int = 3;
		
		private var _layers:Array;

		private var _container:Sprite;
		
		public function UIManager()
		{
		}
		
		public function setup():void{
			_container = new Sprite();
			_layers = [];
			
			for(var i:int = 0; i < COUNT; i++) 
			{
				var layer:GameLayer = new GameLayer();
				_container.addChild(layer);
				_layers.push(layer);
			}
			
			layer = LayerManager.instance.getLayer(GameLayer.UI);
			layer.addChild(_container);
		}
		
		public function addChild(displayObject:DisplayObject, index:int = 0):void{
			var layer:GameLayer = _layers[index];
			layer.addChild(displayObject);
		}
		
		public function clear():void{
			for(var i:int = 0; i < COUNT; i++) 
			{
				var layer:GameLayer = _layers[i] as GameLayer;
				layer.removeChildren();
			}
		}

		public static function get instance():UIManager
		{
			if(!_instance){
				_instance = new UIManager();
			}
			return _instance;
		}

	}
}