package com.yo.framework.objects.animation
{
	import com.yo.framework.core.FP;
	import com.yo.framework.interfaces.IAnimation;
	
	public class Animation implements IAnimation
	{
		public var currentFrameIndex:int = 0;
		
		protected var _info:AnimationInfo;
		
		protected var _costTime:Number = 0.0;
		
		protected var _totalTime:Number = 0.0;
		
		public function Animation()
		{
		}
		
		public function update():void {
			var nowFrameIndex:int = Math.min(_info.totalFrames - 1, int(_costTime / _info.delay));
			
			currentFrameIndex = nowFrameIndex;
			
			if(_costTime < _totalTime)
			{
				_costTime += FP.elapsed;
			}
			
			if(_costTime >= _totalTime)
			{
				if(!_info.loop)
				{
					end();
				}
				else
				{
					resume();
				}
			} 
		}
		
		public function play():void
		{
		}
		
		public function pause():void
		{
		}
		
		public function resume():void
		{
		}
		
		public function stop():void
		{
		}
		
		public function end():void
		{
		}
		
		public function dispose():void
		{
		}
		
		public function get info():AnimationInfo
		{
			return _info;
		}

		public function set info(value:AnimationInfo):void
		{
			_info = value;
		}
	}
}