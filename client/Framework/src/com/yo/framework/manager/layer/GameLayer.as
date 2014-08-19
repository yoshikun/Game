package com.yo.framework.manager.layer
{
	import flash.display.Sprite;

	/**
	 * 层次结构
	 */	
	public class GameLayer extends Sprite
	{
		/**
		 * 远景 
		 */		
		public static const BACKGROUND:int = 0;
		
		/**
		 * 中景 
		 */		
		public static const FLOOR:int = 1;
		
		/**
		 * 物体下层(如光环效果等)
		 */		
		public static const BELOW_OBJECT:int = 2;
		
		/**
		 * 物体层(人物,怪物等) 
		 */		
		public static const OBJECT:int = 3;
		
		/**
		 * 物体上层(如受击特效,血条等) 
		 */		
		public static const ABOVE_OBJECT:int = 4;
		
		/**
		 * 前景层 
		 */		
		public static const FRONT:int = 5;
		
		/**
		 * 游戏界面 
		 */		
		public static const UI:int = 6;
		
		/**
		 * 提示 
		 */		
		public static const TIP:int = 7;
		
		/**
		 * 消息 
		 */		
		public static const MESSAGE:int = 8;
		
		/**
		 * 图层位置 
		 */		
		public var index:int;
		
		public function GameLayer()
		{
		}
	}
}