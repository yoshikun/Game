package com.yo.framework.objects.movement
{
	import com.yo.framework.core.FP;
	import com.yo.framework.objects.MovingEntity;
	import com.yo.framework.utils.Vector2D;
	
	import flash.geom.Point;
	
	public class PointMovement extends Movement
	{
		private var target:Vector2D;
		private var range:Number;
		private var angle:Number;
		private var dist:Number;
		
		public function PointMovement(owner:MovingEntity, target:Point)
		{
			super(owner);
			this.target = new Vector2D(target.x, target.y);
			var distX:Number = target.x - owner.position.x;
			var distY:Number = target.y - owner.position.y;
			dist = Math.sqrt(Math.pow(distX, 2) + Math.pow(distY, 2));
			angle = Math.atan2(distY, distX);
		}
		
		
		override public function update():void {
			// 到目标点的偏移量
			var offset:Vector2D = target.subtract(new Vector2D(owner.position.x, owner.position.y));
			// 消耗时间
			var elapsedSecond:Number = FP.elapsed / 1000;
			// 本次时间能走的量
			var deltaPos:Number = owner.speed * elapsedSecond;
			
			// 如果本次偏移量可以直接到达
			if (offset.length <= deltaPos) {
                owner.position.x = target.x;
                owner.position.y = target.y;
                dispatchEvent(new MovementEvent(MovementEvent.ARRIVED));
			} else {
				owner.move(angle);
			}
		}
	}
}