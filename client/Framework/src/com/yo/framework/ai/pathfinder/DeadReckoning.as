package com.yo.framework.ai.pathfinder
{
	import com.yo.framework.core.FP;
	import com.yo.framework.interfaces.IComponent;
	import com.yo.framework.objects.entity.MovingEntity;
	import com.yo.framework.objects.event.EntityEvent;
	import com.yo.framework.utils.Transfer;
	import com.yo.framework.utils.Vector3DUtil;
	
	import flash.geom.Vector3D;
	
	/**
	 * 同步组件
	 * 航位推测法 
	 */    
	public class DeadReckoning implements IComponent
	{
		//预测的物理量
		public var velocity:Vector3D = new Vector3D();
		
		public var position:Vector3D = new Vector3D();
		
		public var moving:Boolean = false;
		
		private var _lastPos:Vector3D;
		
		private var _sendingDist:Number;
		
		private var _entity:MovingEntity;
		
		private var _visible:Boolean;
		
		public const THRESHOLD:Number = 20;
		
		public function DeadReckoning(entity:MovingEntity)
		{
			_entity = entity;
			_lastPos = entity.position.clone(); 

			_sendingDist = Transfer.instance.cellWidth;
		}
		
		public function updateState(isSend:Boolean = false):void{
			if(!position.equals(_entity.position))
			{
				position = _entity.position.clone();
				isSend = true;
			}
			if(!velocity.equals(_entity.velocity))
			{
				velocity = _entity.velocity.clone();
				isSend = true;
			}
			if(moving != _entity.moving)
			{
				moving = _entity.moving;
				//如果刚启动，不发送更新，防止停止的时候滑步
				isSend = true;
			}
			
			if(isSend)
			{
				_lastPos.x = _entity.position.x;
				_lastPos.y = _entity.position.y;
				_lastPos.z = _entity.position.z;
				
				_entity.dispatchEvent(new EntityEvent(EntityEvent.ENTITY_MOVE_REQUEST));
			}
		}
		
		public function update():void
		{
			//速度
			var nextPosition:Vector3D = position.clone();
			nextPosition.incrementBy(Vector3DUtil.multiply(velocity, (FP.elapsed / 1000)));
			var isBlock:Boolean = _entity.checkCollide(nextPosition);
			
			if(!isBlock){
				position = nextPosition;	
			}
			
			//如果预测点与当前点有偏差
			if(Vector3DUtil.dist(position, _entity.position) > THRESHOLD){
				updateState();
			}
			//如果更改了状态（停止及移动的时候立即发包）
			if(moving != _entity.moving){
				updateState();
			}
			
			//如果更新了格子，则发包
			var dist:Number = Vector3DUtil.dist(_lastPos, _entity.position);
			if (dist >= _sendingDist - 20) {
				updateState(true);
			}
		}
		
		public function render():void{
			
		}
		
		public function dispose():void
		{
		}
		
		public function get name():String
		{
			return "";
		}

		public function get entity():MovingEntity
		{
			return _entity;
		}

		public function set entity(value:MovingEntity):void
		{
			_entity = value;
		}

		public function get visible():Boolean
		{
			return _visible;
		}

		public function set visible(value:Boolean):void
		{
			_visible = value;
		}

		
	}
}