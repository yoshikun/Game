package com.yo.framework.geom
{
	import com.yo.framework.utils.Vector2D;
	
	
	public class Geometry
	{
		public function Geometry()
		{
		}
		
		/**
		 * 判断线段是否相交 
		 * 实时碰撞检测算法技术 104页
		 * 矢量法
		 * @param a
		 * @param b
		 * @param c
		 * @param d
		 * @return 
		 * 
		 */		
		public static function lineSegmentIntersection2D(a:Vector2D, b:Vector2D, c:Vector2D, d:Vector2D):Vector2D{
			// b' = new Vector2D(b.x - a.x, b.y - a.y);
			// d'  = new Vector2D(d.x - c.x, d.y - c.y);
			// b = a + t * b'
			// d = c + u * d'
			var bx:Number = b.x - a.x;
			var by:Number = b.y - a.y;
			var dx:Number = d.x - c.x;
			var dy:Number = d.y - c.y;
			// 叉积
			// ab点乘cd的法线，如果为0代表平行
			var abDotDPerp:Number = bx * dy - by * dx;
			// 平行（斜率相等）
			if (abDotDPerp == 0) {
				return null;
			}
			
			var cx:Number = c.x - a.x;
			var cy:Number = c.y - a.y;
			// ac点乘cd的法线，得出时间t
			var t:Number = (cx * dy - cy * dx) / abDotDPerp;
			if (t < 0 || t > 1) {
				return null;
			}
			var u:Number = (cx * by - cy * bx) / abDotDPerp;
			if (u < 0 || u > 1) {
				return null;
			}

			return new Vector2D(a.x + t * bx, a.y + t * by);
		}
		
		/**
		 * 判断直线是否相交 
		 * @param a
		 * @param b
		 * @param c
		 * @param d
		 * @return 
		 * 
		 */		
		public static function lineIntersection2D(a:Vector2D,
														 b:Vector2D,
														 c:Vector2D,
														 d:Vector2D):Vector2D {
			var bx:Number = b.x - a.x;
			var by:Number = b.y - a.y;
			var dx:Number = d.x - c.x;
			var dy:Number = d.y - c.y;
			// 叉积
			// ab点乘cd的法线，如果为0代表平行
			var abDotDPerp:Number = bx * dy - by * dx;
			// 平行（斜率相等）
			if (abDotDPerp == 0) {
				return null;
			}
			
			var cx:Number = c.x - a.x;
			var cy:Number = c.y - a.y;
			// ac点乘cd的法线，得出时间t
			var t:Number = (cx * dy - cy * dx) / abDotDPerp;
			
			
			return new Vector2D(a.x + t * bx, a.y + t * by);
		}
		
		/**
		 * 两个圆形是否相交 
		 * @param c1
		 * @param r1
		 * @param c2
		 * @param r2
		 * @return 
		 * 
		 */		
		public static function circleOverlapped(c1:Vector2D, r1:Number, c2:Vector2D, r2:Number):Boolean {
			var distBetweenCenter:Number = c1.dist(c2);
			if (distBetweenCenter < r1 + r2) {
				return true;
			}
			return false;
		}
		
		/**
		 * 判断两点是否在视野内 
		 */			
		public static function lineOfSight(a:Vector2D, b:Vector2D, obstacles:Vector.<Polygon>):Boolean {
			// 遍历所有多边形
			outter: for each (var o:Polygon in obstacles) {
				var lines:Vector.<Line2D> = o.getAllEdges();
				
				// 判断是否与多边形的边相交（不是很有效率）
				for each (var l:Line2D in lines) {
					var p:Vector2D = Geometry.lineSegmentIntersection2D(a, b, l.pa, l.pb);
					if (p) {
						return false;
					}
				}
			}
			return true;
		}
		
		/**
		 * 判断两点是否在视野内 
		 */			
		public static function lineOfSightExcludeVertices(a:Vector2D, b:Vector2D, obstacles:Vector.<Polygon>):Boolean {
			// 遍历所有多边形
			outter: for each (var o:Polygon in obstacles) {
				var lines:Vector.<Line2D> = o.getAllEdges();
				
				// 判断是否与多边形的边相交（不是很有效率）
				for each (var l:Line2D in lines) {
					var p:Vector2D = Geometry.lineSegmentIntersection2DExcludeVertices(a, b, l.pa, l.pb);
					if (p) {
						return false;
					}
				}
			}
			return true;
		}
		
		
		public static function lineSegmentIntersection2DExcludeVertices(a:Vector2D, b:Vector2D, c:Vector2D, d:Vector2D):Vector2D {
			// b' = new Vector2D(b.x - a.x, b.y - a.y);
			// d'  = new Vector2D(d.x - c.x, d.y - c.y);
			// b = a + t * b'
			// d = c + u * d'
			var bx:Number = b.x - a.x;
			var by:Number = b.y - a.y;
			var dx:Number = d.x - c.x;
			var dy:Number = d.y - c.y;
			// 叉积
			// ab点乘cd的法线，如果为0代表平行
			var abDotDPerp:Number = bx * dy - by * dx;
			// 平行（斜率相等）
			if (abDotDPerp == 0) {
				return null;
			}
			
			var cx:Number = c.x - a.x;
			var cy:Number = c.y - a.y;
			// ac点乘cd的法线，得出时间t
			var t:Number = (cx * dy - cy * dx) / abDotDPerp;
			if (t <= 0.01 || t >= 0.99) {
				return null;
			}
			var u:Number = (cx * by - cy * bx) / abDotDPerp;
			if (u <= 0.01 || u >= 0.99) {
				return null;
			}
			
			return new Vector2D(a.x + t * bx, a.y + t * by);
		}
	}
}