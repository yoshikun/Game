package com.yo.framework.objects.movement
{
	import com.yo.framework.core.FP;
	import com.yo.framework.objects.MovingEntity;
	import com.yo.framework.utils.Vector2D;
	
	import flash.geom.Vector3D;
	
	public class PathMovement extends Movement
	{
		private var path:Vector.<Vector2D>;
		private var angle:Number;
		private var nextPoint:Vector2D;
		private var _currentPos:Vector2D;
		
		public function PathMovement(_owner:MovingEntity, path:Vector.<Vector2D>)
		{
			_currentPos = new Vector2D();
			super(_owner);
			setPath(path);
		}
		
		override public function update():void {
			// 消耗时间
			var elapsedSecond:Number = FP.elapsed / 1000;
			
			while (elapsedSecond > 0) {
				var distX:Number = nextPoint.x - _owner.position.x;
				var distY:Number = nextPoint.y - _owner.position.y;
				angle = Math.atan2(distY, distX);
				
				_currentPos.set(_owner.position.x, _owner.position.y);
				// 到目标点的偏移量
				var offset:Vector2D = nextPoint.subtract(_currentPos);
				// 本次时间能走的量
				var deltaPos:Number = _owner.speed * elapsedSecond;
				
				if (offset.length <= deltaPos) {
					_owner.position.x = nextPoint.x;
					_owner.position.y = nextPoint.y;
	                if (!calcNextPoint(_owner.position)) {
	                    dispatchEvent(new MovementEvent(MovementEvent.ARRIVED));
						return;
	                }
					// 获取剩余的逝去时间
					elapsedSecond -= offset.length / _owner.speed;
				} else {
					_owner.move(angle);
					break;
				}
			}
		}
		
		public function setPath(path:Vector.<Vector2D>):void {
			this.path = path;
			calcNextPoint(_owner.position);
		}
        
        private function calcNextPoint(current:Vector3D):Boolean
        {
            if (path.length <= 0) {
                return false;
            }
            nextPoint = path.shift();
			if (nextPoint.distSQ(new Vector2D(current.x, current.y)) < 0.1) {
				return calcNextPoint(current);
			}
			var distX:Number = nextPoint.x - current.x;
			var distY:Number = nextPoint.y - current.y;
			angle = Math.atan2(distY, distX);

            return true;
        }
    }
}