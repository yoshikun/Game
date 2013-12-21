package com.yo.manager.layer
{
	import com.yo.core.Game;
	import com.yo.manager.ui.UIManager;
	
	import flash.display.Sprite;

	/**
	 * 游戏图层管理
	 */	
	public class LayerManager
	{
		private static var _instance:LayerManager;
		
		private var _container:Sprite;
		
		private var _layers:Array;
		
		/**
		 * 层次数量 
		 */		
		private const COUNT:int = 9;
		
		public function LayerManager()
		{
		}
		
		public function setup(game:Game):void{
			_container = new Sprite();
			_layers = [];
			
			for (var i:int = 0; i < COUNT; i++) 
			{
				var layer:Layer = new Layer();
				_container.addChild(layer);
				_layers.push(layer);
			}
			game.addChild(_container);
		}
		
		public function getLayer(index:int):Layer{
			return _layers[index];
		}
		
		public function clear():void{
			var len:int = _layers.length;
			for (var i:int = 0; i < len; i++) 
			{
				var layer:Layer = _layers[i];
				if(i != Layer.UI){
					layer.removeChildren();
				}
			}
		}

		public static function get instance():LayerManager
		{
			if(!_instance){
				_instance = new LayerManager();
			}
			return _instance;
		}

	}
}