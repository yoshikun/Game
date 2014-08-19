package com.yo.framework.geom
{
	import com.yo.framework.utils.Vector2D;
	
	import flash.geom.Matrix;
	import flash.geom.Point;

	/**
	 * 坐标转换类 
	 */	
	public class Transformations
	{
		public function Transformations()
		{
		}
		
		/**
		 * 转换为世界空间 
		 * @param point
		 * @param heading
		 * @param pos
		 * @return 
		 * 
		 */		
		public static function pointToWorldSpace(point:Point, heading:Vector2D, pos:Vector2D):Point {
			// 等于坐标系的仿射变换
			var m:Matrix = new Matrix();
			m.rotate(heading.angle);
			m.translate(pos.x, pos.y);
			return m.transformPoint(point);
		}
		
		/**
		 * 转换为局部坐标 
		 * @param point
		 * @param heading
		 * @param pos
		 * @return 
		 * 
		 */		
		public static function pointToLocalSpace(point:Point, heading:Vector2D, pos:Vector2D):Point {
			// 局部坐标系原点在局部坐标系的投影
			var tx:Number = -pos.dotProd(heading);
			var ty:Number = -pos.dotProd(heading.perp);
			var m:Matrix = new Matrix();
			m.rotate(-heading.angle);
			m.translate(tx, ty);
			return m.transformPoint(point);
		}
	}
}