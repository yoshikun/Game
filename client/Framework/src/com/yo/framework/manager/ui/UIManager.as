package com.yo.framework.manager.ui
{
	import com.yo.framework.manager.layer.Layer;
	import com.yo.framework.manager.layer.LayerManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	/**
	 * UI管理
	 */	
	public class UIManager
	{
		private static var _instance:UIManager;
		
		private var _container:Sprite;
		
		public static const BELLOW:int = 0;
		
		public static const MIDDLE:int = 1;
		
		public static const ABOVE:int = 2;
		
		private const COUNT:int = 3;
		
		private var _layers:Array;

		public function UIManager()
		{
		}
		
		public function setup():void{
			var layer:Layer;
			
			_container = new Sprite();
			_layers = [];
			
			for(var i:int = 0; i < COUNT; i++) 
			{
				layer = new Layer();
				_container.addChild(layer);
				_layers.push(layer);
			}
			
			layer = LayerManager.instance.getLayer(Layer.UI);
			layer.addChild(_container);
		}
		
		public function addChild(displayObject:DisplayObject, index:int = 0):void{
			var layer:Layer = _layers[index];
			layer.addChild(displayObject);
		}
		
		public function clear():void{
			for(var i:int = 0; i < COUNT; i++) 
			{
				var layer:Layer = _layers[i] as Layer;
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