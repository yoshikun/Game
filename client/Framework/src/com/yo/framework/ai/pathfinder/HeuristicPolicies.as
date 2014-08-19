package com.yo.framework.ai.pathfinder
{
	import com.yo.framework.utils.Vector2D;

	/**
	 * 启发函数库 
	 */	
	public class HeuristicPolicies
	{
		public function HeuristicPolicies()
		{
		}
		
		/**
		 * 曼哈顿算法 
		 */		
		public static function manhattan(pos0:Vector2D, pos1:Vector2D):Number{
			var d1:uint = Math.abs(pos1.x - pos0.x);
			var d2:uint = Math.abs(pos1.y - pos0.y);
			return d1 + d2;
		}
		
		public static function euclid(pos0:com.yo.framework.utils.Vector2D, pos1:Vector2D):Number {
			return pos1.dist(pos0);
		}
	}
}