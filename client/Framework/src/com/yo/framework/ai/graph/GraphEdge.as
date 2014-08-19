package com.yo.framework.ai.graph
{
	import flash.utils.ByteArray;

	public class GraphEdge
	{
		public var from:int;
		public var to:int;
		public var cost:Number;
		
		public function GraphEdge(f:int = 0, t:int = 0, c:Number = 1)
		{
			from = f;
			to = t;
			cost = c;
		}
	}
}