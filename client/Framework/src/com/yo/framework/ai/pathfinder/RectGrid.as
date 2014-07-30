package com.yo.framework.ai.pathfinder
{
	import com.yo.framework.ai.graph.GraphEdge;
	import com.yo.framework.ai.graph.NaviGraphNode;
	import com.yo.framework.ai.graph.SparseGraph;
	import com.yo.framework.core.FP;
	import com.yo.framework.geom.Geometry;
	import com.yo.framework.geom.Polygon;
	import com.yo.framework.interfaces.ITransfer;
	import com.yo.framework.logger.Log;
	import com.yo.framework.utils.Vector2D;
	
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.utils.getTimer;

	/**
	 * 矩形网格寻路 
	 */	
	public class RectGrid
	{
		private var _naviGraph:SparseGraph;
		
		private var _astar:AStar;
		
		private var _transfer:ITransfer;
		
		private var _debugLayer:Sprite;
		
		private var _graphLayer:Sprite;
		
		private var _obstacleLayer:Sprite;
		
		private var _obstacles:Vector.<Polygon>;
		
		private var _pathLayer:Sprite;
		
		public function RectGrid(graph:SparseGraph, obstacles:Vector.<Polygon>, transfer:ITransfer)
		{
			_naviGraph = graph;
			_obstacles = obstacles;
			_transfer = transfer;
			
			_astar = new AStar(_naviGraph);
			
			_obstacleLayer = new Sprite();
			_obstacleLayer.cacheAsBitmap = true;
			
			_graphLayer = new Sprite();
			_graphLayer.cacheAsBitmap = true;
			
			_pathLayer = new Sprite();
			_pathLayer.cacheAsBitmap = true;
			
			_debugLayer = new Sprite();
			_debugLayer.cacheAsBitmap = true;
			
			_debugLayer.addChild(_obstacleLayer);
			_debugLayer.addChild(_graphLayer);
			_debugLayer.addChild(_pathLayer);
		}

		public function search(startPoint:Vector2D, endPoint:Vector2D):Vector.<Vector2D> {
			var paths:Vector.<Vector2D> = new Vector.<Vector2D>;
			var startTime:int = getTimer();

			// 如果开始点跟结束点视野内可见，则直接返回这两个点形成的路径
			if(Geometry.lineOfSightExcludeVertices(startPoint, endPoint, _obstacles))
			{
				paths.push(startPoint);
				paths.push(endPoint);
				
				Log.getLog(this).debug("寻路时间（直连）", getTimer() - startTime, "ms");
				drawPath(startPoint, paths);
				return paths;
			}
			
			var startNodeIndex:int = _transfer.getNodeIndex(startPoint);
			var endNodeIndex:int = _transfer.getNodeIndex(endPoint);
			
			var opath:Vector.<int> = searchNodePath(startNodeIndex, endNodeIndex)
			
			var len:int = opath.length;
			for(var j:int = 0; j < len; j++) 
			{
				var node:NaviGraphNode = _naviGraph.getNode(opath[j]) as NaviGraphNode;
				if (node) {
					paths[j] = new Vector2D(node.position.x * _transfer.cellWidth + _transfer.cellWidth / 2, node.position.y * _transfer.cellHeight + _transfer.cellWidth / 2);
				}
			}
			
			//加上起点终点
			paths.unshift(startPoint);
			
			//如果路径的最后一个点和目的点可以到达
			var cPoint:Vector2D = paths[paths.length - 1];
			if(Geometry.lineOfSightExcludeVertices(cPoint, endPoint, _obstacles))
			{
				paths.push(endPoint);
			}
			
			//删除转折点
			paths = checkLineOfSight(paths);
			
			Log.getLog(this).debug("寻路时间", getTimer() - startTime, "ms");
			drawPath(startPoint, paths);
			return paths;
		}
		
		public function searchNodePath(startNodeIndex:int, endNodeIndex:int):Vector.<int>{
			_astar.search(startNodeIndex, endNodeIndex);
			return _astar.getPath();
		}
		
		/**
		 * 三点光照检测
		 */		
		private function checkLineOfSight(paths:Vector.<Vector2D>):Vector.<Vector2D>{
			var cPoint:Vector2D;
			var nPoint:Vector2D;
			var step:int = 2;
			for (var i:int = 0; i < paths.length - step; i++) {
				cPoint = paths[i];
				
				for (var k:int = i + step; k < paths.length;) {
					nPoint = paths[k];
					
					if(!Geometry.lineOfSightExcludeVertices(cPoint, nPoint, _obstacles)){
						break;
					}else{
						//直接删除这个路径会导致k的索引相对于旧索引自增1
						paths.splice(k - 1, 1);
					}
				}
			}
			return paths;
		}
		
		/**
		 * 找到最优的格子 
		 * XXX 遍历的话速度很慢
		 * @return 
		 * 
		 */		
		public function findBestGrid(endPoint:Vector2D, startPoint:Vector2D):int {
			var minDistSQ:Number = Number.MAX_VALUE;
			var minDistToStartSQ:Number = Number.MAX_VALUE;
			var bestIndex:int = -1;
			var current:Vector2D = new Vector2D();
			
			for each (var node:NaviGraphNode in _naviGraph.nodes) {
				if (!node || node.type == 1) continue;
				var i:int = node.index;
				current.x = int(i % _transfer.maxColumn);
				current.y = int(i / _transfer.maxColumn);
				
				var distSQ:int = current.distSQ(endPoint);
				var distToStartSQ:int = current.distSQ(startPoint);
				if (distSQ < minDistSQ) {
					minDistSQ = distSQ;
					bestIndex = i;
				} else if (distSQ == minDistSQ && distToStartSQ < minDistToStartSQ) {
					minDistSQ = distSQ;
					bestIndex = i;
					minDistToStartSQ = distToStartSQ;
				}
			}
			return bestIndex;
		}
		
		/**
		 * 绘制所有导航图 
		 * 
		 */		
		public function drawNaviGraph():void {
			_graphLayer.graphics.clear();
			_obstacleLayer.graphics.clear();
			var len:int = _naviGraph.nodes.length;
			for (var i:int = 0; i < len; i++) {
				var currentNode:NaviGraphNode = _naviGraph.nodes[i] as NaviGraphNode;
				if (!currentNode){
					continue;
				}
				if (currentNode.type == 1) {
					drawPolygon(currentNode);
				} else {
					drawPolygon(currentNode, 0x00FF00);
				}
				
				buildEdges(currentNode);
				
				var vertices:Vector.<GraphEdge> = _naviGraph.edges[i];
				if(vertices){
					// 画线
					var len1:int = vertices.length;
					for(var j:int = 0; j < len1; j++) 
					{
						var neighborNode:NaviGraphNode = _naviGraph.nodes[_naviGraph.edges[i][j].to] as NaviGraphNode;
						//生成可见的调试图，清楚点
						drawGraph(currentNode, neighborNode);
					}
				}
			}
		}
		
		/**
		 * 绘制障碍多边形 
		 */		
		private function drawPolygon(node:NaviGraphNode, color:int = 0xFF0000):void{
			var vertices:Vector.<Vector2D> = node.polygon.vertices;
			//多边形的起点位置
			var xpos:int = _transfer.getScreenX(vertices[0].x);
			var ypos:int = _transfer.getScreenY(vertices[0].y);
			
			_obstacleLayer.graphics.lineStyle(1, 0x0, 0.3);
			_obstacleLayer.graphics.beginFill(color, 0.3);
			_obstacleLayer.graphics.moveTo(xpos, ypos);
			
			for (var i:int=1; i<vertices.length; i++) {
				_obstacleLayer.graphics.lineTo(_transfer.getScreenX(vertices[i].x), _transfer.getScreenY(vertices[i].y));
			}
			_obstacleLayer.graphics.lineTo(xpos, ypos);
			_obstacleLayer.graphics.endFill();
			
			var t:TextField = new TextField();
			t.autoSize = "left";
			t.x = xpos;
			t.y = ypos;
			t.text = node.index.toString();
			t.selectable = false;
			t.mouseEnabled = false;
			_obstacleLayer.addChild(t);
		}
		
		
		/**
		 * 绘制导航图，方便调试 
		 */		
		private function drawGraph(f:NaviGraphNode, t:NaviGraphNode):void{
			var color:uint = 0x00FFFF;
			var point:Point = getRealPosition(f.position);
			
			_graphLayer.graphics.lineStyle(2, color, 0.5);
			_graphLayer.graphics.drawCircle(point.x, point.y, 2);
			_graphLayer.graphics.moveTo(point.x, point.y);
			
			point = getRealPosition(t.position);
			_graphLayer.graphics.lineTo(point.x, point.y);
		}
		
		/**
		 * 绘制路径 
		 */		
		private function drawPath(startPoint:Vector2D, pathVector:Vector.<Vector2D>):void {
			var layer:Sprite = _pathLayer;
			layer.graphics.clear();
			layer.graphics.lineStyle(2, 0xFF0000, 0.7);
			layer.graphics.moveTo(_transfer.getScreenX(startPoint.x), _transfer.getScreenY(startPoint.y));
			layer.graphics.drawCircle(_transfer.getScreenX(startPoint.x), _transfer.getScreenY(startPoint.y), 5);
			for each(var p:Vector2D in pathVector){
				layer.graphics.lineTo(_transfer.getScreenX(p.x), _transfer.getScreenY(p.y));
				layer.graphics.drawCircle(_transfer.getScreenX(p.x), _transfer.getScreenY(p.y), 5);
			}
			layer.graphics.endFill();
		}
		
		private function getRealPosition(pos:Vector2D):Point{
			return new Point(_transfer.getScreenX(pos.x * _transfer.cellWidth + _transfer.cellWidth / 2), 
							 _transfer.getScreenY(pos.y * _transfer.cellHeight + _transfer.cellHeight / 2));
		}
		
		/**
		 * 创建节点边 
		 */		
		public function buildEdges(node:NaviGraphNode):void {
			if (node.type == 0) {
				var neighbors:Array = [];
				//north
				if(int(node.index / _transfer.maxColumn) > 0){
					neighbors.push(_naviGraph.getNode(node.index - _transfer.maxColumn));
					//north east
					if(int(node.index % _transfer.maxColumn) < _transfer.maxColumn - 1){
						neighbors.push(_naviGraph.getNode(node.index - _transfer.maxColumn + 1));
					}
				}
				//south
				if(int(node.index / _transfer.maxColumn) < _transfer.maxRow - 1){
					neighbors.push(_naviGraph.getNode(node.index + _transfer.maxColumn));
					//south west
					if(int(node.index % _transfer.maxColumn) > 0){
						neighbors.push(_naviGraph.getNode(node.index + _transfer.maxColumn - 1));
					}
				}
				//east
				if(int(node.index % _transfer.maxColumn)  < _transfer.maxColumn - 1){
					neighbors.push(_naviGraph.getNode(node.index + 1));
					//east south
					if(Math.ceil(node.index / _transfer.maxColumn) < _transfer.maxRow - 1){
						neighbors.push(_naviGraph.getNode(node.index + _transfer.maxColumn + 1));
					}
				}
				
				//west
				if(int(node.index % _transfer.maxColumn) > 0){
					neighbors.push(_naviGraph.getNode(node.index - 1));
					//west noth
					if(int(node.index / _transfer.maxColumn) > 0){
						neighbors.push(_naviGraph.getNode(node.index - _transfer.maxColumn));
					}
				}
				
				//生成边
				var len1:int = neighbors.length;
				for (var j:int = 0; j < len1; j++) {
					var neighborNode:NaviGraphNode = neighbors[j];
					if (neighborNode && neighborNode.type == 0) {
						var naviEdge:GraphEdge = new GraphEdge(node.index, neighborNode.index, node.position.dist(neighborNode.position));
						_naviGraph.addEdge(naviEdge);
					}
				}
			}
		}
		
		/**
		 * 某个位置是否是障碍点 
		 * @param cellX 网格坐标X
		 * @param cellY 网格坐标Y
		 * @return 
		 * 
		 */		
		private function isBlock(cellX:int, cellY:int):Boolean {
			var node:NaviGraphNode = _naviGraph.getNode(cellX + cellY * _transfer.maxColumn) as NaviGraphNode;
			if (!node || node.type == 1) {
				return true;
			}
			return false;
		}
		/**
		 * 两点间是否可见（基本单位，格子）
		 * 参考直线光栅化算法 
		 * @param s
		 * @param e
		 * @return 
		 * 
		 */		
		public function lineOfSight(s:Vector2D, e:Vector2D):Boolean {
			var x0:Number = _transfer.getCellX(s.x);
			var y0:Number = _transfer.getCellY(s.y);
			
			var x1:Number = _transfer.getCellX(e.x);
			var y1:Number = _transfer.getCellY(e.y);
			
			var dx:Number = Math.abs(x1 - x0);
			var dy:Number = Math.abs(y1 - y0);
			var sx:Number = 1;
			var sy:Number = 1;
			var steps:int = Math.max(dx, dy);

			if (dx > dy) {
				sx = 1;
				sy = dy / dx;
			}
			
			if (dy > dx) {
				sy = 1;
				sx = dx / dy;
			}
			
			if (y0 > y1) {
				sy = -sy;
			}
			
			if (x0 > x1) {
				sx = -sx;
			}
			
			for (var i:int = 0; i < steps; i++) {
				x0 += sx;
				y0 += sy;
				
				if (isBlock(x0, y0)) {
					return false;
				}
			}
			
			return true;
		}
		
		/**
		 * 两点间是否可见（基本单位，格子）
		 * 参考直线光栅化算法 
		 * @param s
		 * @param e
		 * @return 
		 * 
		 */		
		public function lineOfSight2(s:Vector2D, e:Vector2D):Boolean {
			var x0:Number = _transfer.getCellX(s.x);
			var y0:Number = _transfer.getCellY(s.y);
			
			var x1:Number = _transfer.getCellX(e.x);
			var y1:Number = _transfer.getCellY(e.y);
			
			var dx:Number = x1 - x0;
			var dy:int = y1 - y0;
			var sx:Number = 1;
			var sy:int = 1;
			var f:int = 0;
			
			if (dy < 0) {
				sy = -1;
				dy = -dy;
			}
			
			if (dx < 0) {
				sx = -1;
				dx = -dx;
			}
			if (dx > dy) {
				while (x0 != x1) {
					f += dy;
					if (f > dx) {
						if (isBlock(x0, y0 + sy)) {
							return false;
						}
						y0 += sy;
						f -= dx;
					}
					if (isBlock(x0 + sx, y0)) {
						return false;
					}
					x0 += sx;
				}
			} else {
				while (y0 != y1) {
					f += dx;
					if (f > dy) {
						if (isBlock(x0 + sx, y0)) {
							return false;
						}
						x0 += sx;
						f -= dy;
					}
					if (isBlock(x0, y0 + sy)) {
						return false;
					}
					y0 += sy;
				}
			}
			
			return true;
		}
		
		/**
		 * 同样是视线检测，但是范围是起点终点所占矩形
		 * 很准确 
		 * @param s
		 * @param e
		 * @return 
		 * 
		 */		
		public function lineOfSight3(s:Vector2D, e:Vector2D):Boolean {
			var x0:Number = _transfer.getCellX(s.x);
			var y0:Number = _transfer.getCellY(s.y);
			
			var x1:Number = _transfer.getCellX(e.x);
			var y1:Number = _transfer.getCellY(e.y);
			
			var tmp:int;
			
			if (x0 > x1) {
				tmp = x1;
				x1 = x0;
				x0 = tmp;
			}
			if (y0 > y1) {
				tmp = y1;
				y1 = y0;
				y0 = tmp;
			}
			
			var xIndex:int = x0;
			var yIndex:int = y0;
			while (xIndex <= x1) {
				yIndex = y0;
				while (yIndex <= y1) {
					if (isBlock(xIndex, yIndex)) {
						return false;
					}
					yIndex ++;
				}
				xIndex ++;
			}
			return true;
		}

		public function get debugLayer():Sprite
		{
			return _debugLayer;
		}

		public function set debugLayer(value:Sprite):void
		{
			_debugLayer = value;
		}

		public function get obstacles():Vector.<Polygon>
		{
			return _obstacles;
		}

		public function set obstacles(value:Vector.<Polygon>):void
		{
			_obstacles = value;
		}
	}
}