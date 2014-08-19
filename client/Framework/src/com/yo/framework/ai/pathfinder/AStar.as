package com.yo.framework.ai.pathfinder
{
	import com.yo.framework.ai.graph.GraphEdge;
	import com.yo.framework.ai.graph.NaviGraphNode;
	import com.yo.framework.ai.graph.SparseGraph;
	
	import de.polygonal.ds.Heap;
	
	/**
	 * A*寻路 
	 */	
	public class AStar
	{
		
		private var _openedHeap:Heap;
		private var _graph:SparseGraph;
		
		/**
		 * 之所以不放在节点值内部，是担心以后会有多次搜索的需求 
		 */		
		private var _fCosts:Vector.<Number>;
		private var _gCosts:Vector.<Number>;
		
		private var _start:int;
		private var _end:int;
		
		/**
		 * 离终点最近的点耗费 
		 */		
		private var _nearestCost:Number;
		
		/**
		 * 离终点最近的点 
		 */		
		private var _nearestNodeIndex:int;
		
		/**
		 * 最短路径树 
		 */		
		private var _shortestPathTree:Vector.<GraphEdge>;

		/**
		 * 节点到边的索引数组 
		 */		
		private var _searchFrontier:Vector.<GraphEdge>;
		
		public function AStar(graph:SparseGraph){
			_graph = graph;
		}
		
		/**
		 * 搜索 
		 */		
		public function search(start:int, end:int):void {
			if (_openedHeap) {
				_openedHeap.clear();
			} else {
				_openedHeap = new Heap(_graph.edges.length, function(a:Number, b:Number):Number{return _fCosts[b] - _fCosts[a];} );
			}
			var len:int = _graph.nodes.length;
			_gCosts = new Vector.<Number>(len);
			_fCosts = new Vector.<Number>(len);
			_searchFrontier = new Vector.<GraphEdge>(len);
			_shortestPathTree = new Vector.<GraphEdge>(len);
			
			_nearestCost = Number.MAX_VALUE;
			_nearestNodeIndex = -1;
			
			// 临时存储
			_start = start;
			_end = end;
			
			// 插入开始点
			_openedHeap.enqueue(start);
			
			var endNode:NaviGraphNode = NaviGraphNode(_graph.getNode(end));
			
			if (! endNode) return;
			
			// 如果还有开放节点
			while (_openedHeap.size > 0){
				// 获取最小f的节点
				var currentIndex:int = _openedHeap.dequeue();
				// 关闭当前节点
				_shortestPathTree[currentIndex] = _searchFrontier[currentIndex];
				// 查找到当前点为结束点
				if (currentIndex == end) {
					return;
				}
				// 获取周边节点
				var edges:Vector.<GraphEdge> = _graph.edges[currentIndex];
				
				if(edges){
					for (var i:int = 0; i < edges.length; i++) {
						var e:GraphEdge = edges[i];
						// 如果已经在最短路径表，则继续下一个边
						if (_shortestPathTree[e.to] != null) {
							continue;
						}
						var hCost:Number = HeuristicPolicies.euclid(NaviGraphNode(_graph.getNode(e.to)).position, endNode.position);
						var gCost:Number = _gCosts[currentIndex] + e.cost;
						// 如果没放在搜索边界
						if (_searchFrontier[e.to] == null) {
							_fCosts[e.to] = gCost + hCost;
							_gCosts[e.to] = gCost;
							
							_openedHeap.enqueue(e.to);
							_searchFrontier[e.to] = e;
						}
							// 如果已经在搜索边界中，且新的代价比较小，则重新更新f，g值
						else if (gCost < _gCosts[e.to]) {
							_fCosts[e.to] = gCost + hCost;
							_gCosts[e.to] = gCost;
							_openedHeap.resort(e.to);
							_searchFrontier[e.to] = e;
						}
						if(hCost < _nearestCost){
							_nearestCost = hCost;
							_nearestNodeIndex = e.to;
						}
					}
				}
			}
		}
		
		/**
		 * 获取生成的路径 
		 */		
		public function getPath():Vector.<int> {
			var path:Vector.<int> = new Vector.<int>();
			
			var nodeIndex:int = _end;
			var edge:GraphEdge = _shortestPathTree[nodeIndex];
			
			//如果是不可到达的点,则取一个耗费离终点最近的点和起点的路径
			if(!edge){
				nodeIndex = _nearestNodeIndex;
			}
			
			if(nodeIndex > 0){
				path.push(nodeIndex);
			}
			
			if(nodeIndex >= 0){
				while (nodeIndex != _start) {
					nodeIndex = _shortestPathTree[nodeIndex].from;
					path.push(nodeIndex);
				}
			}
			path.reverse();
			return path;
		}
	}
}