package com.yo.framework.objects.animation
{
	import com.yo.framework.core.FP;
	import com.yo.framework.interfaces.IAnimation;
	
	import flash.display.BitmapData;
	
	public class Animation implements IAnimation
	{
		public var currentFrameIndex:int = 0;
		
		protected var _name:String;
		
		protected var _info:AnimationInfo;
		
		protected var _costTime:Number = 0.0;
		
		protected var _frame:Vector.<AnimationFrameInfo>;
		
		public function Animation()
		{
			_frame = new Vector.<AnimationFrameInfo>();
		}
		
		public function update():void {
			if(_info)
			{
				var nowFrameIndex:int = Math.min(_info.totalFrames - 1, int(_costTime / _info.delay));
				
				currentFrameIndex = nowFrameIndex;
				
				if(_costTime < _info.totalTime)
				{
					_costTime += FP.elapsed;
				}
				
				if(_costTime >= _info.totalTime)
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
		}
		
		public function play():void
		{
		}
		
		public function pause():void
		{
		}
		
		public function resume():void
		{
			currentFrameIndex = 0;
			_costTime = 0;
		}

		public function stop():void
		{
		}
		
		public function end():void
		{
		}
		
		public function get resource():BitmapData
		{
			if(_frame.length > 0)
			{
				var info:AnimationFrameInfo = _frame[currentFrameIndex] as AnimationFrameInfo;
				if(info)
				{
					return info.texture;
				}
			}
			return null;
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

		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}

		public function get frame():Vector.<AnimationFrameInfo>
		{
			return _frame;
		}

		public function set frame(value:Vector.<AnimationFrameInfo>):void
		{
			_frame = value;
		}


	}
}