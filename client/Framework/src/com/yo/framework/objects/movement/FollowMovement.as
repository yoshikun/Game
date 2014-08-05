package com.yo.framework.objects.movement
{
	import com.yo.framework.objects.BaseEntity;
	import com.yo.framework.objects.MovingEntity;
	
	import flash.utils.getTimer;
	
	public class FollowMovement extends Movement
	{
		private var _target:BaseEntity;
		private var _offset:Number;
		private var _dist:Number;
		private var _lastStopTime:int;
		
		public function FollowMovement(owner:MovingEntity, target:BaseEntity, offset:Number)
		{
			super(owner);
			_target = target;
			_offset = offset;
		}
		
		private function _isCloseToTarget():Boolean {
			return _dist <= _offset;
		}
		
		override public function update():void {
			var distX:Number = _target.position.x - _owner.position.x;
			var distY:Number = _target.position.y - _owner.position.y;
			_dist = Math.sqrt(Math.pow(distX, 2) + Math.pow(distY, 2));
			var angle:Number = Math.atan2(distY, distX);
			
			//更新
			if(_isCloseToTarget())
			{
				_owner.stop(false);
				_lastStopTime = getTimer();
			}
			else
			{
				//让他呆一会
				if (getTimer() - _lastStopTime > 200) {
					_owner.move(angle);
				}
			}
		}
		
	}
}