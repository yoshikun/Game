package com.yo.framework.objects.movement
{
	import com.yo.framework.objects.entity.MovingEntity;
	
	public class AngleMovement extends Movement
	{
		private var _angle:Number;
		public function AngleMovement(owner:com.yo.framework.objects.entity.MovingEntity, angle:Number)
		{
			super(owner);
			_angle = angle;
		}
		override public function update():void {
			_owner.move(_angle);
		}
	}
}