package com.yo.framework.ai.pathfinder
{
	import com.yo.framework.ai.graph.GraphEdge;
	import com.yo.framework.ai.graph.NaviGraphNode;
	import com.yo.framework.ai.graph.SparseGraph;
	import com.yo.framework.geom.Geometry;
	import com.yo.framework.geom.Line2D;
	import com.yo.framework.geom.Polygon;
	import com.yo.framework.utils.Vector2D;
	
	import flash.utils.getTimer;

	/**
	 * Point-Of-Visibility
	 * 可见点寻路 
	 */	
	public class Pov
	{
		private var _obstacles:Vector.<Polygon>;
		private var _naviGraph:SparseGraph;
		
		public function Pov(graph:SparseGraph, obstacles:Vector.<Polygon>)
		{
			_obstacles = obstacles;
			_naviGraph = graph;
		}
		
		public function search(startPoint:Vector2D, endPoint:Vector2D, isFixEndPoint:Boolean = true):Vector.<Vector2D> {
			var paths:Vector.<Vector2D> = new Vector.<Vector2D>;
			var startTime:int = getTimer();
			
			// 如果开始点跟结束点视野内可见，则直接返回这两个点形成的路径
			if (Geometry.lineOfSight(startPoint, endPoint, _obstacles)) {
				paths.push(startPoint);
				paths.push(endPoint);
				return paths;
			}
			
			
			// 判断起始点与终点的连线是否与多边形有交点，如果有，则离起点最近交点作为新终点
			if (isFixEndPoint && ! _obstacles[0].isPointIn(endPoint.toPoint())) {
				var pathLine:Line2D = new Line2D(startPoint, endPoint);
				var minDistSQ:Number = Number.MAX_VALUE;
				var minVector:Vector2D = null;
				for each (var o:Polygon in _obstacles) {
					var lines:Vector.<Line2D> = o.getAllEdges();
					for each (var l:Line2D in lines) {
						var v:Vector2D = l.intersectionLine2D(pathLine);
						if (v) {
							var distSQ:Number = v.distSQ(startPoint);
							if (distSQ < minDistSQ) {
								minDistSQ = distSQ;
								minVector = v;
							}
						}
					}
				}
				
				if (minVector != null) {
					var toEnd:Vector2D = endPoint.subtract(startPoint).normalize();
					// 交点往前10像素，防止贴合边缘
					endPoint = minVector.subtract(toEnd.multiply(10));
				}
			}
			
			// 加入原始图
			// 将开始点与终点原始图，构造边线
			var newGraph:SparseGraph = _naviGraph.clone();
			
			var startNode:NaviGraphNode = new NaviGraphNode();
			startNode.index = newGraph.getNextNodeIndex();
			startNode.position = startPoint;
			newGraph.addNode(startNode);
			createEdge(startNode, newGraph);
			
			var endNode:NaviGraphNode = new NaviGraphNode();
			endNode.index = newGraph.getNextNodeIndex();
			endNode.position = endPoint;
			newGraph.addNode(endNode);
			createEdge(endNode, newGraph);
			
			// 进行a星查找
			var astar:AStar = new AStar(newGraph);
		
			// 寻径
			astar.search(startNode.index, endNode.index);
			
			// 得到路径
			var opaths:Vector.<int> = astar.getPath();
			
			
			for each (var pathIndex:int in opaths) {
				var p:NaviGraphNode = newGraph.nodes[pathIndex] as NaviGraphNode;
				paths.push(new Vector2D(p.position.x, p.position.y));
			}
			trace('search time', getTimer() - startTime);
			
			return paths;
		}
		
		
		public function fixEndPoint(startPoint:Vector2D, endPoint:Vector2D):Vector2D {
			var pathLine:Line2D = new Line2D(startPoint, endPoint);
			var includePolygon:Polygon = null
			for each (var o:Polygon in _obstacles) {
				if (o.isPointIn(endPoint.toPoint())) {
					includePolygon = o;
					break;
				}
			}
			if (includePolygon) {
				var minDistSQ:Number = Number.MAX_VALUE;
				var minVector:Vector2D = null;
				for each (o in _obstacles) {
					var lines:Vector.<Line2D> = o.getAllEdges();
					for each (var l:Line2D in lines) {
						var v:Vector2D = l.intersectionLine2D(pathLine);
						if (v) {
							var distSQ:Number = v.distSQ(startPoint);
							if (distSQ < minDistSQ) {
								minDistSQ = distSQ;
								minVector = v;
							}
						}
					}
				}
			} else {
				return endPoint;
			}
			
			if (minVector != null) {
				var toEnd:Vector2D = startPoint.subtract(endPoint).normalize();
				// 交点往前1像素，防止贴合边缘
				return minVector.add(toEnd);
			} else {
				trace('啊，好奇怪，居然没有交点');
				return endPoint;
			}
		}
		
		
		/**
		 * 构造边(可行走的边)
		 */		
		private function createEdge(cNode:NaviGraphNode, graph:SparseGraph):void {
			for (var oIndex:int = 0; oIndex < graph.nodes.length; oIndex++) {
				var oNode:NaviGraphNode = graph.nodes[oIndex] as NaviGraphNode;
				if (oNode == cNode) continue;
				// 判断当前节点与其他节点是否视野可见
				// 如果可见，则增加一条边
				if (Geometry.lineOfSight(cNode.position, oNode.position, _obstacles)) {
					var naviEdge:GraphEdge = new GraphEdge(cNode.index, oNode.index, cNode.position.dist(oNode.position));
					graph.addEdge(naviEdge);
				}
			}
		}
	}
}