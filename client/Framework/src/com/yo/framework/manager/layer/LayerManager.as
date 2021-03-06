package com.yo.framework.manager.layer
{
	import com.yo.framework.core.Game;
	import com.yo.framework.manager.ui.UIManager;
	
	import flash.display.Sprite;

	/**
	 * 游戏图层管理
	 */	
	public class LayerManager
	{
		private static var _instance:LayerManager;
		
		/**
		 * 游戏容器 
		 */		
		private var _container:Sprite;
		
		/**
		 * 游戏层 
		 */		
		public var layers:Vector.<GameLayer>;
		
		/**
		 * 层数量 
		 */		
		public const COUNT:int = 9;
		
		public function LayerManager()
		{
		}
		
		public function setup(game:Game):void{
			_container = new Sprite();
			layers = new Vector.<GameLayer>();
			
			for (var i:int = 0; i < COUNT; i++) 
			{
				var layer:GameLayer = new GameLayer();
				layer.index = i;
				layer.mouseEnabled = false;
				layer.cacheAsBitmap = true;
				_container.addChild(layer);
				layers.push(layer);
			}
			game.addChild(_container);
		}
		
		public function getLayer(index:int):GameLayer{
			return layers[index];
		}
		
		public function clear():void{
			var len:int = layers.length;
			for (var i:int = 0; i < len; i++) 
			{
				var layer:GameLayer = layers[i];
				if(i != GameLayer.UI)
				{
					layer.removeChildren();
				}
			}
		}

		public static function get instance():LayerManager
		{
			if(!_instance)
			{
				_instance = new LayerManager();
			}
			return _instance;
		}

	}
}