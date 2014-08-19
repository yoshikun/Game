package com.yo.game.objects
{
	import com.yo.framework.objects.entity.MovingEntity;
	import com.yo.game.data.vo.EntityVo;
	
	public class GameEntity extends MovingEntity
	{
		protected var _vo:EntityVo
		
		public function GameEntity()
		{
			super();
		}
		
		override public function update():void
		{
			super.update();
		}

		public function get vo():EntityVo
		{
			return _vo;
		}

		public function set vo(value:EntityVo):void
		{
			_vo = value;
			update();
		}
	}
}