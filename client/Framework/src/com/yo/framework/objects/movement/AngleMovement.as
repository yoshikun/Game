package com.yo.framework.objects.movement
{
	import com.yo.framework.objects.MovingEntity;
	
	public class AngleMovement extends Movement
	{
		private var _angle:Number;
		public function AngleMovement(owner:MovingEntity, angle:Number)
		{
			super(owner);
			_angle = angle;
		}
		override public function update():void {
			owner.move(_angle);
		}
	}
}