package com.yo.framework.objects.entity
{
	import com.yo.framework.core.FP;
	import com.yo.framework.objects.movement.AngleMovement;
	import com.yo.framework.objects.movement.Movement;
	import com.yo.framework.objects.movement.MovementEvent;
	import com.yo.framework.objects.movement.PathMovement;
	import com.yo.framework.objects.movement.PointMovement;
	import com.yo.framework.objects.movement.TargetMovement;
	import com.yo.framework.utils.Vector2D;
	
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	
	/**
	 * 可移动实体 
	 */    
	public class MovingEntity extends BaseEntity
	{
		/**
		 * 基本的物理量 
		 */		
		public var velocity:Vector3D;
		
		/**
		 * 速度加速度 
		 */		
		public var acceleration:Vector3D;
		
		/**
		 * 速度 
		 */		
		public var speed:int = 200;
		
		/**
		 * 当前移动方式 
		 */		
		protected var _movement:Movement;
		
		/**
		 * 是否正在移动 
		 */		
		protected var _moving:Boolean = false;
		
		/**
		 * 是否可以移动 
		 */		
		protected var _movable:Boolean = true;
		
		protected var _onArrivedCallback:Function;
		
		protected var _angle:Number;
		
		protected var _onArrivedCallBackParams:Array;
		
		protected var _knockbacking:Boolean = false;
		
		protected var _jumping:Boolean = false;
		
		/**
		 * 跳跃速度
		 */		
		protected var _jumpTime:Number;
		
		protected var _jumpTarget:Point;
		
		protected var _accelerationDelta:Vector3D;
		
		protected var _velocityDelta:Vector3D;
		
		public function MovingEntity()
		{
		}
		
		override protected function init():void
		{
			velocity = new Vector3D(0, 0, 0);
			acceleration = new Vector3D(0, 0, 0);	
		}
		
		/**
		 * 更新 
		 */        
		override public function update():void
		{
			super.update();
		}
		
		public function moveTarget(target:MovingEntity, delta:Point):void{
			clearMovement();
			_movement = new TargetMovement(this, target, delta);
		}
		
		/**
		 * 朝某个角度移动 
		 */		
		public function moveAngle(angle:Number):void{
			clearMovement();
			_movement = new AngleMovement(this, angle);
		}
		/**
		 * 击退 
		 */        
		public function knockback(target:Point, time:uint):void{
//			if(time == 0){
//				position.x = target.x;
//				position.y = target.y;
//				return;
//			}
//			_knockbacking = true;
//			var len:Number = Vector3DUtil.dist(position, new Vector3D(target.x, target.y, 0));
//			var kspeed:int = 1000 * len / time;
//			clearMovement();
//			_movement = new KnockbackMovement(this, target, kspeed);
//			_movement.addEventListener(MovementEvent.ARRIVED, onArrived);
		}
		
		/**
		 * 移动到某点 
		 */        
		public function moveTo(p:Point, onArrivedCallback:Function = null):void{
			clearMovement();
			_movement = new PointMovement(this, p);
			_onArrivedCallback = onArrivedCallback;
			_movement.addEventListener(MovementEvent.ARRIVED, onArrived);
		}
		
//		public function follow(target:MovingEntity, offset:Number = 100):void
//		{
//			clearMovement();
//			_movement = new FollowMovement(this, target, offset);
//		}
		
		/**
		 * 跟随路径 
		 */        
		public function followPath(p:Vector.<Vector2D>, onArrivedCallback:Function = null, onArrivedCallBackParams:Array = null):void{
			if(!p || p.length <= 0)
			{
				return;
			}
			_onArrivedCallback = onArrivedCallback;
			_onArrivedCallBackParams = onArrivedCallBackParams;
			if(_movement is PathMovement)
			{
				PathMovement(_movement).setPath(p);
				return;
			}
			clearMovement();
			_movement = new PathMovement(this, p);
			_movement.addEventListener(MovementEvent.ARRIVED, onArrived);
		}
		
		protected function onArrived(event:Event):void
		{
			if(_onArrivedCallback != null){
				_onArrivedCallback.apply(null, _onArrivedCallBackParams);
			}
			stop();
		}
		
		public function clearMovement():void{
			if(_movement){
				_movement.remove();
				_movement = null;
			}
		}
		
		/**
		 * 朝某个角度移动 
		 */        
		public function move(angle:Number, isForce:Boolean=false):void{
			//某些动画运行过程中，是无法移动的
			if(Math.abs(Math.cos(angle)) > 0.0001)
			{
				direction = toDirection(angle);
			}
			_angle = angle;
			_moving = true;
			
			if(_movable){
				//更新速度值
				velocity.x = speed * Math.cos(angle);
				velocity.y = speed * Math.sin(angle);
				updatePosition();
			}
		}
		
		public function updatePosition():void{
			//逝去秒数
			var elapsedSecond:Number = FP.elapsed / 1000;
			var nextPos:Vector3D;
			
			if(!_accelerationDelta)
			{
				_accelerationDelta = new Vector3D();
			}
			_accelerationDelta.x = acceleration.x;
			_accelerationDelta.y = acceleration.y;
			_accelerationDelta.z = acceleration.z;
			_accelerationDelta.w = acceleration.w;
			_accelerationDelta.scaleBy(elapsedSecond);
			
			if(!_velocityDelta)
			{
				_velocityDelta = new Vector3D();
			}
			_velocityDelta.x = velocity.x;
			_velocityDelta.y = velocity.y;
			_velocityDelta.z = velocity.z;
			_velocityDelta.w = velocity.w;
			_velocityDelta.scaleBy(elapsedSecond);
			
			//速度加速度
			velocity.incrementBy(_accelerationDelta);
			nextPos = position.add(_velocityDelta);
			var isBlock:Boolean = checkCollide(nextPos);
			
			if(!isBlock)
			{
				position = nextPos;
			}
			else
			{
				adjustPosition(nextPos);
			}
		}
		
		protected function adjustPosition(nextPos:Vector3D):void
		{
			position.z = nextPos.z;
		}
		
		/**
		 * 停止 
		 */		
		public function stop(isClearMovement:Boolean = true):void{
			velocity.x = 0;
			velocity.y = 0;
			_moving = false;
			_knockbacking = false;
			_jumping = false;
			if(isClearMovement)
			{
				clearMovement();
			}
		}
		
		public function toDirection(angle:Number):int{
			return Math.cos(angle) > 0 ? 1:-1;
		}
		
		public function getDirectionTo(target:BaseEntity):int{
			var angle:Number = getAngle(new Point(target.position.x, target.position.y));
			if(Math.abs(Math.cos(angle)) > 0.001){
				return toDirection(angle);
			}
			return direction;
		}
		
		public function faceTo(target:BaseEntity):void{
			direction = getDirectionTo(target);
		}
		
		/**
		 * 获取到目标点的角度 
		 */		
		public function getAngle(target:Point):Number{
			var distX:Number = target.x - position.x;
			var distY:Number = target.y - position.y;
			return Math.atan2(distY, distX);
		}
		
		public function get moving():Boolean
		{
			return _moving;
		}
		
		public function set moving(value:Boolean):void
		{
			_moving = value;
		}
		
		public function get movable():Boolean
		{
			return _movable;
		}
		
		public function set movable(value:Boolean):void
		{
			_movable = value;
		}
		
		override public function dispose():void{
			clearMovement();
			super.dispose();
		}
		
		public function set knockbacking(value:Boolean):void
		{
			_knockbacking = value;
		}
		
		public function get knockbacking():Boolean
		{
			return _knockbacking;
		}
		
		public function get jumping():Boolean
		{
			return _jumping;
		}
		
		public function canMove():Boolean{
			return true;
		}
		
		public function set movement(value:Movement):void
		{
			_movement = value;
		}
		
		public function get movement():Movement
		{
			return _movement;
		}
	}
}