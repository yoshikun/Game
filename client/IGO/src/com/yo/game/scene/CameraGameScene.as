package com.yo.game.scene
{
	import com.yile.games.doll.scene.camera.Camera;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.ui.Keyboard;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	/**
	 * 横版卷轴游戏场景
	 */
	public class CameraGameScene extends GameScene
	{
		/**
		 * 摄像机 
		 */		
		protected var _camera:Camera;
		
		/**
		 * 物件容器 
		 */		
		protected var _dollEntitiesById:Dictionary;
		
		protected var _playersById:Dictionary;
		
		protected var _dollEntities:Vector.<DollEntity>;
		
		/**
		 * 深度排序相关 
		 */        
		protected const SORT_TIME:int = 200;
		
		/**
		 * 最后进行排序的时间 
		 */		
		protected var _lastSortTime:int = 0;
		
		/**
		 * 是否进行深度排序 
		 */		
		public var isSort:Boolean = true;
		
		public function CameraGameScene(game:Main)
		{
			super(game);
		}
		
		
		public function setCameraBound(w:Number, h:Number):void{
			_camera.bound = new Rectangle(0, 0, w, h);
		}
		
		protected function initCamera():void
		{
			//设定摄像机边界
			setCameraBound(width, height);
			//最小缩放
			_camera.zoomMin = Math.max(GlobalModel.instance.stageWidth / width, GlobalModel.instance.stageHeight / height);
		}
		
		override public function onEnter():void{
			_camera = new Camera(GlobalModel.instance.stageWidth, GlobalModel.instance.stageHeight);
			super.enter();
		}
		
		override protected function initEntitiesAndLayers():void {
			_dollEntitiesById = new Dictionary()
			_dollEntities = new Vector.<DollEntity>();
			_playersById = new Dictionary();
			super.initEntitiesAndLayers();
		}
		
		override protected function clearEntitiesAndLayers():void {
			super.clearEntitiesAndLayers();
			_dollEntitiesById = null;
			_dollEntities = null;
			_playersById = null;
		}
		
		override public function update():void{
			super.update();
			// 更新深度
			if(isSort){
				isSort && updateSort();
			}
			
			ProfilerManager.instance.benchmarkStart("Camera Update");
			
			// 更新摄像机信息
			if(_camera){
				_camera.update();
			}
			
			// 移动除了UI图层
			// 视差卷轴
			for each(var zorder:GameSceneZOrder in _zOrders) {
				if(zorder.name != ZOrder.FRONT){
					var speedX:Number = 1;
					var speedY:Number = 1;
					
					// 背景按背景宽度做慢速移动
					if(zorder.name == ZOrder.BACKGROUND){
						// 由于原始的宽高被放大了，所以重新除掉
						speedX =(zorder.width / camera.zoom  - camera.width) /(width - camera.width);
					}
					
					var tx:int = -(_camera.left) * speedX;
					var ty:int = -(_camera.top) * speedY;
					
					// 场景平移
					CONFIG::cpu{
						// 限制渲染区域
						zorder.c.scrollRect = new Rectangle(-tx, -ty, GlobalModel.instance.stageWidth / camera.zoom, GlobalModel.instance.stageHeight / camera.zoom);
						var m:Matrix = zorder.c.transform.matrix;
						m.identity();
						//                        m.translate(tx, ty);
						// 按摄像机中心做缩放
						m.scale(camera.zoom, camera.zoom);
						//                        m.translate(-tx, -ty);
						zorder.c.transform.matrix = m;
					}
					CONFIG::gpu{
						//                        var cx:Number =(_camera.scrollX) * speedX;
						//                        var cy:Number =(_camera.scrollY) * speedY;
						zorder.c.pivotX = -tx;
						zorder.c.pivotY = -ty;
						//                        zorder.c.x = cx + tx;
						//                        zorder.c.y = cy + ty;
						zorder.c.scaleX = camera.zoom;
						zorder.c.scaleY = camera.zoom;
					}
				}
			}
			ProfilerManager.instance.benchmarkEnd("Camera Update");
			
			updateKeyEvent();
		}
		
		protected function updateKeyEvent():void
		{
			if (! Misc.isTextFieldFocus()){
				
				// 摄像机放大（视域变小）
				if (InputManager.instance.keyDown(Keyboard.NUMPAD_ADD)){
					camera.zoom += 0.02;
				}
				
				// 摄像机缩小（视域变大）
				if (InputManager.instance.keyDown(Keyboard.NUMPAD_SUBTRACT)){
					camera.zoom -= 0.02;
				}
				
				// 帧频变大，计算量变大
				if (InputManager.instance.keyHit(Keyboard.NUMPAD_MULTIPLY)){
					Global.fps = Math.min(500, Global.fps + 10);
				}
				
				// 帧频变小，计算量变小
				if (InputManager.instance.keyHit(Keyboard.NUMPAD_DIVIDE)){
					Global.fps = Math.max(10, Global.fps - 10);
				}
			}
		}
		
		/**
		 * 按ID获取实体 
		 */		
		public function getEntityByGUID(id:GUID, isWarning:Boolean = true):DollEntity{
			var e:DollEntity;
			if(id.type == 1){
				e = _dollEntitiesById[id.id];
			}else{
				e = _playersById[id.id];
			}
			if(!e){
				if(isWarning){
					_log.warn("194不存在的NPCID" + id.id);
				}
				return null;
			}
			return e;
		}
		
		/**
		 * 按ID获取实体 
		 */		
		public function getEntityById(id:int, isWarning:Boolean = true):DollEntity{
			var e:DollEntity = _dollEntitiesById[id];
			if(!e){
				if(isWarning){
					_log.warn("204不存在的NPCID" + id);
				}
				return null;
			}
			return e;
		}
		
		/**
		 * 按ID获取实体 
		 */		
		public function getPlayerById(id:int, isWarning:Boolean = true):DollEntity{
			var e:DollEntity = _playersById[id];
			if(!e){
				if(isWarning){
					_log.warn("不存在的玩家ID" + id);
				}
				return null;
			}
			return e;
		}
		
		/**
		 * 场景深度排序 
		 */        
		protected function updateSort():void
		{
			CONFIG::debug{
				ProfilerManager.instance.benchmarkStart('Sort');
			}
			if(entities && 
				getTimer() - _lastSortTime > SORT_TIME){
				
				// 深度排序
				entities.sort(sortYIndex);
				
				CONFIG::cpu{
					var container:flash.display.Sprite = clipForZOrder(ZOrder.OBJECT);
				}
				CONFIG::gpu{
					var container:starling.display.Sprite = clipForZOrder(ZOrder.OBJECT);
				}
				var index:int = 0;
				for(var i:uint = 0, l:uint = entities.length; i < l; i++){
					var entity:BaseEntity = entities[i];
					var d:flash.display.DisplayObject = entity.renderer as flash.display.DisplayObject;
					if(!d){
						continue;
					}
					if(d.parent != container){
						continue;
					}
					entity.index = index;
					container.setChildIndex(d, index++);
				}
				
				_lastSortTime = getTimer();
			}
			CONFIG::debug{
				ProfilerManager.instance.benchmarkEnd('Sort');
			}
		}
		
		/**
		 * 深度排序内部函数 
		 */		
		protected function sortYIndex(a:BaseEntity, b:BaseEntity):int{
			var ay:Number = a.position.y;
			var by:Number = b.position.y;
			
			if(ay > by){
				return 1;
			}else if(ay < by){
				return -1;
			}else{
				if(a.index > b.index){
					return 1;
				}else{
					return -1;
				}
			}
			return 0;
		}
		
		override public function addEntity(e:BaseEntity):void{
			var dollEntity:DollEntity = e as DollEntity;
			if(dollEntity){
				_dollEntities.push(dollEntity);
				if(dollEntity.vo.entityType == EntityType.NPC) {
					_dollEntitiesById[dollEntity.vo.id] = dollEntity;
				} else if (dollEntity.vo.entityType == EntityType.PLAYER) {
					_playersById[dollEntity.vo.id] = dollEntity;
				}
			}
			super.addEntity(e);
		}
		
		override public function removeEntity(e:BaseEntity):void{
			var dollEntity:DollEntity = e as DollEntity;
			if(dollEntity){
				var index:int = _dollEntities.indexOf(dollEntity);
				if(index != -1){
					var nextP:DollEntity = _dollEntities[_dollEntities.length - 1] as DollEntity;
					_dollEntities[_dollEntities.length - 1] = dollEntity;
					_dollEntities[index] = nextP;
					_dollEntities.pop();
				}
				
				if(dollEntity.vo.entityType == EntityType.NPC) {
					delete _dollEntitiesById[dollEntity.vo.id];
				} else if (dollEntity.vo.entityType == EntityType.PLAYER) {
					delete  _playersById[dollEntity.vo.id];
				}
			}
			super.removeEntity(e);
		}
		
		override public function onExit():void{
			super.onExit();
			_camera = null;
			_data = null;
		}
		
		public function get dollEntities():Vector.<DollEntity>
		{
			return _dollEntities;
		}
		
		public function get camera():Camera
		{
			return _camera;
		}
	}
}