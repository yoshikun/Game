package com.yo.framework.geom
{
	import com.yo.framework.utils.Vector2D;

	public class Line2D
	{
		public var pa:Vector2D;
		public var pb:Vector2D;
		
		public static const LEFT:String = "left";
		public static const RIGHT:String = "right";
		public static const ONLINE:String = "online";
		
		public function Line2D(pa:Vector2D, pb:Vector2D)
		{
			this.pa = pa;
			this.pb = pb;
		}
		
		/**
		 * 获取法线 （右手）
		 * @return 
		 * 
		 */		
		public function get normal():Vector2D {
			return new Vector2D(pb.x - pa.x, pb.y - pa.y).normalize().perp;
		}
		
		/**
		 * 获得法线有向距离（沿法线方向为正） 
		 */		
		public function normalDist(p:Vector2D):Number {
			var v:Vector2D = p.subtract(pa);
			return v.dotProd(normal);
		}
		
		/**
		 * 判断点与直线关系 
		 * 从pa往pb看
		 */		
		public function classifyPoint(point:Vector2D, epsilon:Number = 0.0001):String 
		{
			var result:String = ONLINE;
			var distance:Number = normalDist(point);
			
			if (distance > epsilon) {
				result = RIGHT;
			}
			else if (distance < -epsilon) {
				result = LEFT;
			}
			
			return result;
		}
		
		/**
		 * 判断是否在线段范围内，粗略判断，与classifyPoint结合可精确判断 
		 */		
		public function isOnline(point:Vector2D):String{
			if(point.x < pa.x && point.x < pb.x){
				return LEFT;
			}else if(point.x > pa.x && point.x > pb.x){
				return RIGHT;
			}else{
				return ONLINE;
			}
		}
		
		/**
		 * 返回两个线段交点
		 */		
		public function intersectionLine2D(line:Line2D):Vector2D {
			return Geometry.lineSegmentIntersection2D(pa, pb, line.pa, line.pb);
		}
	}
}