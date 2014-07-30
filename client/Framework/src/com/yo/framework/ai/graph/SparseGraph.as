package com.yo.framework.ai.graph
{
	/**
	 * 稀疏图 
	 */	
	public class SparseGraph
	{
		public var nodes:Vector.<GraphNode>;
		public var edges:Vector.<Vector.<GraphEdge>>;
		
		// 是否是有向图
		private var _isDirect:Boolean;
		
		public function SparseGraph(isDirect:Boolean = false)
		{
			_isDirect = isDirect;
			init();
		}
		
		public function get isDirect():Boolean
		{
			return _isDirect;
		}

		public function init():void {
			nodes = new Vector.<GraphNode>();
			edges = new Vector.<Vector.<GraphEdge>>();
		}
		
		public function getNextNodeIndex():int {
			return nodes.length;
		}
		
		/**
		 * 增加节点 
		 */		
		public function addNode(node:GraphNode):void {
			// 如果是已有的节点，则修改原始数据
			
			// 自动扩充
			if (node.index >= nodes.length) {
				edges.length = nodes.length = node.index + 1;
			}
			nodes[node.index] = node;
			edges[node.index] = new Vector.<GraphEdge>();
		}
		
		/**
		 * 移除图节点的边
		 */		
		public function removeNode(index:int):void {
			nodes[index] = null;
			
			removeEdges(index);
		}
		
		public function removeEdges(index:int):void{
			// 如果不是有向图的话，需要删除连接到这个节点的其他所有边
			if (! _isDirect) {
				// 遍历当前点的所有边
				var edgeList:Vector.<GraphEdge> = edges[index] as Vector.<GraphEdge>;
				if (edgeList) {
					for (var i:int = 0; i < edgeList.length; i++) {
						var toEdge:GraphEdge = edgeList[i];
						var toNodeEdges:Vector.<GraphEdge> = edges[toEdge.to] as Vector.<GraphEdge>;
						for (var j:int = 0; j < toNodeEdges.length; j++) {
							if (toNodeEdges[j].to == index) {
								toNodeEdges.splice(j, 1);
								// 应该只有一个
								break;
							}
						}
					}
				}
			}
			edges[index] = null;
		}
		
		/**
		 * 获取图节点 
		 */		
		public function getNode(index:int):GraphNode {
			if(index < 0){
				return null;
			}
			if(index >= nodes.length){
				return null;
			}
			return nodes[index];
		}
		
		/**
		 * 增加边 
		 */		
		public function addEdge(edge:GraphEdge):void {
			if (! getNode(edge.from) || ! getNode(edge.to)) {
				throw new Error("无效的边界");
			}
			if (edge.from == edge.to) {
				throw new Error("无效的边界");
			}
			if(!edges[edge.from]){
				edges[edge.from] = new Vector.<GraphEdge>();
			}
			if (isUniqueEdge(edge.from, edge.to)) {
				edges[edge.from].push(edge);
			}
			
			// 如果不是有向图，则需在目标节点也增加一条反向边
			if (! _isDirect) {
				var e:GraphEdge = new GraphEdge(edge.to, edge.from, edge.cost);
				if (isUniqueEdge(e.from, e.to)) {
					edges[e.from].push(e);
				}
			}
		}
		
		/**
		 * 判断是否是唯一的边，防止意外 
		 * @param f
		 * @param t
		 * @return 
		 * 
		 */		
		public function isUniqueEdge(f:int, t:int):Boolean {
			var edgeList:Vector.<GraphEdge> = edges[f] as Vector.<GraphEdge>;
			for each (var e:GraphEdge in edgeList) {
				if (e.to == t) {
					return false;
				}
			}
			
			return true;
		}
		
		/**
		 * 删除边 
		 * @param f
		 * @param t
		 * 
		 */		
		public function removeEdge(f:int, t:int):void {
			// 如果不是有向图
			var edgeList:Vector.<GraphEdge>;
			var i:int;
			var edge:GraphEdge;
			if (! _isDirect) {
				// 遍历目标点的所有边
				// 删除连接到这个点的边
				edgeList = edges[t];
				for (i = 0; i < edgeList.length; i++) {
					edge = edgeList[i];
					if (edge.to == f) {
						edgeList.splice(i, 1);
						// 应该只有一个
						break;
					}
				}
			}
			
			edgeList = edges[f];
			for (i = 0; i < edgeList.length; i++) {
				edge = edgeList[i];
				if (edge.to == t) {
					edgeList.splice(i, 1);
					// 应该只有一个
					break;
				}
			}
		}
		
		/**
		 * 克隆图 
		 * @return 
		 * 
		 */		
		public function clone():SparseGraph {
			var s:SparseGraph = new SparseGraph(isDirect);
			s.nodes = this.nodes.concat();
			s.edges = this.edges.concat();
			for (var i:int = 0; i < this.edges.length; i++) {
				s.edges[i] = this.edges[i].concat();
			}
			return s;
		}
	}
}