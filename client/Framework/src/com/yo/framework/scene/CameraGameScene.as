package com.yo.framework.scene
{
	import com.yo.framework.core.FP;
	import com.yo.framework.interfaces.IEntity;
	import com.yo.framework.manager.InputManager;
	import com.yo.framework.manager.layer.GameLayer;
	import com.yo.framework.manager.layer.LayerManager;
	import com.yo.framework.objects.BaseEntity;
	import com.yo.framework.utils.Misc;
	
	import flash.display.DisplayObject;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.ui.Keyboard;
	import flash.utils.getTimer;
	
	/**
	 * 游戏场景
	 */
	public class CameraGameScene extends GameScene
	{
		/**
		 * 摄像机 
		 */		
		protected var _camera:Camera;
		
		protected var _scaleMatrix:Matrix;
		
		protected var _scrollRect:Rectangle;
		
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
		
		public function CameraGameScene()
		{
			super();
		}
		
		protected function initCamera():void
		{
			//最小缩放
			_camera.zoomMin = 0.5;
			_camera.bound = new Rectangle(0, 0, _width, _height);
		}
		
		override public function enter():void{
			super.enter();
			_camera = new Camera(FP.stage.stageWidth, FP.stage.stageHeight);
			
			_scaleMatrix = new Matrix();
			_scrollRect = new Rectangle(); 
		}
		
		override public function update():void{
			super.update();
			//更新深度
			if(isSort){
				isSort && updateSort();
			}
			
			//更新摄像机信息
			if(_camera){
				_camera.update();
			}
			
			//视差卷轴
			for each(var layer:GameLayer in LayerManager.instance.layers)
			{
				if(layer.index != GameLayer.FRONT && layer.index != GameLayer.UI)
				{
					var speedX:Number = 1;
					var speedY:Number = 1;
					
					//背景按背景宽度做慢速移动
					if(layer.index == GameLayer.BACKGROUND){
						//由于原始的宽高被放大了，所以重新除掉
						speedX = (layer.width / _camera.zoom  - _camera.width) / (_width - _camera.width);
					}
					
					var tx:int = -(_camera.left) * speedX;
					var ty:int = -(_camera.top) * speedY;
					
					//场景平移,限制渲染区域
					_scrollRect.x = -tx;
					_scrollRect.y = -ty;
					_scrollRect.width = FP.stage.stageWidth / _camera.zoom;
					_scrollRect.height = FP.stage.stageHeight / _camera.zoom;
					layer.scrollRect = _scrollRect;
					
					//如果有缩放
					if(_camera.zoom != 1)
					{
						//归一化
						_scaleMatrix.identity();
						//按摄像机中心做缩放
						_scaleMatrix.scale(_camera.zoom, _camera.zoom);
						layer.transform.matrix = _scaleMatrix;
					}
				}
			}
			
			updateKeyEvent();
		}
		
		protected function updateKeyEvent():void
		{
			if(!Misc.isTextFieldFocus())
			{
				
				//摄像机放大（视域变小）
				if(InputManager.instance.keyDown(Keyboard.NUMPAD_ADD))
				{
					_camera.zoom += 0.02;
				}
				
				//摄像机缩小（视域变大）
				if(InputManager.instance.keyDown(Keyboard.NUMPAD_SUBTRACT))
				{
					_camera.zoom -= 0.02;
				}
				
				//帧频变大，计算量变大
				if(InputManager.instance.keyHit(Keyboard.NUMPAD_MULTIPLY))
				{
					FP.frameRate = Math.min(500, FP.frameRate + 10);
				}
				
				//帧频变小，计算量变小
				if(InputManager.instance.keyHit(Keyboard.NUMPAD_DIVIDE))
				{
					FP.frameRate = Math.max(10, FP.frameRate - 10);
				}
			}
		}
		
		/**
		 * 场景深度排序 
		 */        
		protected function updateSort():void
		{
			if(_entityVector && getTimer() - _lastSortTime > SORT_TIME)
			{
				_entityVector.sort(sortYIndex);
				
				var container:GameLayer= LayerManager.instance.getLayer(GameLayer.OBJECT);

				var index:int = 0;
				for(var i:uint = 0, l:uint = _entityVector.length; i < l; i++)
				{
					var entity:BaseEntity = _entityVector[i] as BaseEntity;
					var render:DisplayObject = entity.renderer as DisplayObject;
					if(!render)
					{
						continue;
					}
					if(render.parent != container)
					{
						continue;
					}
					entity.index = index;
					container.setChildIndex(render, index++);
				}
				_lastSortTime = getTimer();
			}
		}
		
		/**
		 * 深度排序内部函数 
		 */		
		protected function sortYIndex(a:BaseEntity, b:BaseEntity):int{
			var ay:Number = a.position.y;
			var by:Number = b.position.y;
			
			if(ay > by)
			{
				return 1;
			}
			else if(ay < by)
			{
				return -1;
			}
			else
			{
				if(a.index > b.index)
				{
					return 1;
				}
				else
				{
					return -1;
				}
			}
			return 0;
		}
		
		override public function exit():void{
			super.exit();
			_camera = null;
		}
	}
}