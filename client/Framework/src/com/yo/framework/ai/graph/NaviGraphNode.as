package com.yo.framework.ai.graph
{
	import com.yo.framework.geom.Polygon;
	import com.yo.framework.utils.Vector2D;

	public class NaviGraphNode extends GraphNode
	{
		public var position:Vector2D;
		
		/**
		 * 节点类型
		 *  0:障碍
		 *  1:可以行走
		 */		
		public var type:int;
		
		public var polygon:Polygon;
		
		public function NaviGraphNode()
		{
			
		}
	}
}