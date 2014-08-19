package com.yo.framework.objects
{
	import com.yo.framework.mvc.interfaces.IDisposable;

	public class RenderState implements IDisposable
	{
		public var x:int;
		
		public var y:int;
		
		public var dirty:Boolean;
		
		public var regX:int;
		
		public var regY:int;
		
		public var scaleX:int;
		
		public function RenderState()
		{
		}
		
		public function dispose():void
		{
			
		}
	}
}