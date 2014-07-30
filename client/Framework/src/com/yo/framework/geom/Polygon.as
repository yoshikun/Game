package com.yo.framework.geom
{
	import com.yo.framework.utils.Vector2D;
	
	import flash.display.Graphics;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;

	/**
	 * 多边形 
	 */	
	public class Polygon
	{
		/**
		 * 顶点信息 
		 */		
		public var vertices:Vector.<Vector2D>;
		
		/**
		 * 矩形包围盒 
		 */		
		private var rect:Rectangle;
		
		public function Polygon(vertices:Vector.<Vector2D> = null)
		{
			this.vertices = vertices;
		}
		
		/**
		 * 获取所有多边形边缘线 
		 * @return 
		 * 
		 */		
		public function getAllEdges():Vector.<Line2D> {
			var lines:Vector.<Line2D> = new Vector.<Line2D>();
			for (var i:int = 0, l:int = vertices.length - 1; i < l; i++) {
				var line:Line2D = new Line2D(vertices[i], vertices[i + 1]);
				lines.push(line);
			}
			lines.push(new Line2D(vertices[vertices.length - 1], vertices[0]));
			return lines;
		}
		
		/**
		 * 判断顶点是否在多边形边缘 
		 */		
		public function getCollideEdge(p:Vector2D):Line2D {
			var lines:Vector.<Line2D> = getAllEdges();
			for each (var l:Line2D in lines) {
				if (l.classifyPoint(p, 3) == Line2D.ONLINE && l.isOnline(p) == Line2D.ONLINE) {
					return l;
				}
			}
			return null;
		}
		
		/**
		 * 判断多边形顶点是顺时间 
		 */		
		public function isClockwise():Boolean {
			var topIndex:int = 0;
			var topVertex:Vector2D = vertices[topIndex];
			// 找到最左上点，此点必为凸点
			for (var i:int = 0, l:int = vertices.length - 1; i < l; i++) {
				var v:Vector2D = vertices[i];
				if (topVertex.y > v.y) {
					topVertex = v;
					topIndex = i;
				} else if (topVertex.y == v.y) {
					if (topVertex.x > v.x) {
						topVertex = v;
						topIndex = i;
					}
				}
			}
			var next:Vector2D = vertices[(topIndex + 1) % vertices.length];
			var previous:Vector2D = vertices[topIndex == 0 ? vertices.length - 1 : topIndex - 1];
			
			var left:Vector2D = new Vector2D(topVertex.x - previous.x, topVertex.y - previous.y);
			var right:Vector2D = new Vector2D(next.x - topVertex.x, next.y - topVertex.y);
			
			var cross:Number = left.crossProd(right);
			
			if (cross > 0) {
				return true;
			} else {
				return false;
			}
		}
		
		/**
		 * 判断顶点是否是凹点 
		 */		
		public function isVertexConcave(index:int):Boolean {
			var current:Vector2D = vertices[index];
			var next:Vector2D = vertices[(index + 1) % vertices.length];
			var previous:Vector2D = vertices[index == 0 ? vertices.length - 1 : index - 1];
			
			var left:Vector2D = new Vector2D(current.x - previous.x, current.y - previous.y);
			var right:Vector2D = new Vector2D(next.x - current.x, next.y - current.y);
			
			var cross:Number = left.crossProd(right);
			
			if (isClockwise()) {
				return cross < 0;
			} else {
				return cross > 0;
			}
		}
		
		/**
		 * 快速判断点是否在多边形内 
		 */		
		public function isPointIn(p:Point):Boolean {
			var crossNum:int = 0;
			var allLine:Vector.<Line2D> = getAllEdges();
			for(var i:int; i < allLine.length; i++){
				var line:Line2D = allLine[i];
				// 先检测边缘
				if ((p.y > line.pa.y && p.y <= line.pb.y ||
					p.y > line.pb.y && p.y <= line.pa.y) &&
					(p.x >= line.pa.x || p.x >= line.pb.x)) {
					var crossX:Number = (p.y - line.pa.y) * (line.pb.x - line.pa.x) / (line.pb.y - line.pa.y) + line.pa.x;
					
					if (crossX < p.x) {
						crossNum++;
					}
				}
			}
			
			// 如果交点数是偶数，则在多边形外面
			if ((crossNum % 2) == 0) {
				return false;
			}
			return true;
		}
		
		/**
		 * 返回矩形包围盒
		 * @return 
		 */		
		public function rectangle():Rectangle {
			if (vertices == null || vertices.length < 0){
				return null;
			}
			
			if (rect != null){
				return rect;
			}
			
			var lx:Number = vertices[0].x;
			var rx:Number = vertices[0].x;
			var ty:Number = vertices[0].y;
			var by:Number = vertices[0].y;
			
			var v:Vector2D;
			for (var i:int=1; i<vertices.length; i++) {
				v = vertices[i];
				if (v.x < lx) {
					lx = v.x;
				}
				if (v.x > rx) {
					rx = v.x;
				}
				if (v.y < ty) {
					ty = v.y;
				}
				if (v.y > by) {
					by = v.y;
				}
			}
			
			rect = new Rectangle(lx, ty, rx-lx, by-ty);
			return rect;
		}
		
		public function draw(g:Graphics, color:uint = 0xFF0000):void {
			g.lineStyle(1, 0x0, 0.3);
			g.beginFill(color, 0.3);
			g.moveTo(vertices[0].x, vertices[0].y);
			
			for (var i:int=1; i<vertices.length; i++) {
				g.lineTo(vertices[i].x, vertices[i].y);
			}
			g.lineTo(vertices[0].x, vertices[0].y);
			g.endFill();
		}
		
		/**
		 * 获得轮廓点 
		 * @param point
		 * @param heading
		 * @return 
		 * 
		 */		
		public function getContourVertices(point:Point, heading:Vector2D):Vector.<Vector2D> {
			var contourVertices:Vector.<Vector2D> = new Vector.<Vector2D>();
			var minY:int = int.MAX_VALUE;
			var minVectex:Vector2D, maxVectex:Vector2D;
			var maxY:int = int.MIN_VALUE;
			var localPoint:Point;
			for each (var v:Vector2D in vertices) {
				localPoint = Transformations.pointToLocalSpace(point, heading, v);
				if (localPoint.y < minY) {
					minY = localPoint.y;
					minVectex = v;
				} 
				if (localPoint.y > maxY) {
					maxY = localPoint.y;
					maxVectex = v;
				}
			}
			contourVertices.push(minVectex, maxVectex);
			return contourVertices;
		}
	}
}