package com.yo.framework.scene
{
	import com.yo.framework.ai.FSM.IState;
	import com.yo.framework.interfaces.IEntity;
	import com.yo.framework.interfaces.IEntityContainer;
	import com.yo.framework.manager.layer.LayerManager;
	import com.yo.framework.manager.scene.IScene;
	import com.yo.framework.utils.Macro;
	import com.yo.framework.utils.Transfer;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.sampler.getSize;
	
	public class GameScene implements IScene, IEntityContainer
	{
		protected var _bound:Rectangle;
		
		protected var _width:Number = 1920;
		
		protected var _height:Number = 600;
		
		/**
		 * 所有实体 
		 */		
		protected var _entityVector:Vector.<IEntity>;
		
		protected var _name:String;
		
		public function GameScene()
		{
		}
		
		public function addChild(child:DisplayObject, layerName:int):void
		{
			if(child)
			{
				LayerManager.instance.getLayer(layerName).addChild(child)
			}
		}
		
		public function removeChild(child:DisplayObject):void
		{
			Macro.saveRemove(child);
		}
		
		public function addEntity(entity:IEntity):void 
		{
			if(_entityVector)
			{
				_entityVector.push(entity);
			}
		}
		
		public function removeEntity(entity:IEntity):void 
		{
			if(_entityVector)
			{
				var index:int = _entityVector.indexOf(entity);
				if(index != -1){
					if(_entityVector.length > 1)
					{
						_entityVector[index] = _entityVector[_entityVector.length - 1];
					}
					_entityVector.pop();
				}
			}
		}
		
		/**
		 * 获取子显示对象总数量
		 */		
		private function getObjectSize(o:flash.display.DisplayObjectContainer):int
		{
			var count:int = o.numChildren;
			var totalSize:int = 0;
			for(var i:int = 0; i < count; ++i)
			{
				var child:DisplayObject = o.getChildAt(i);
				if(child is flash.display.DisplayObjectContainer)
				{
					totalSize += getObjectSize(child as flash.display.DisplayObjectContainer);
				}
				else
				{
					totalSize += getSize(child);
				}
			}
			return totalSize;
		}
		
		public function update():void
		{
			if(_entityVector)
			{
				var entity:IEntity;
				
				for each (entity in _entityVector) 
				{
					entity.update();
				}
				for each (entity in _entityVector) 
				{
					entity.render();
				}
			}
		}
		
		public function enter():void
		{            
			init();
		}
		
		protected function init():void{
			initModel();
			initController();
			initEvent();
			initView();
		}
		
		protected function initModel():void
		{
			_entityVector = new Vector.<IEntity>();
		}
		
		protected function initController():void
		{
		}
		
		protected function initEvent():void
		{
		}
		
		protected function initView():void
		{
		}
		
		private function particleRenderState(x:Number, y:Number, z:Number):Point
		{
			var p:Point = new Point();
			p.x = Transfer.instance.getScreenX(x);
			p.y = Transfer.instance.getScreenY(y, z);
			return p;
		}
		
		public function exit():void
		{			
			clearEntityVector();
		}
		
		/**
		 * 清理实体
		 */		
		protected function clearEntityVector():void 
		{
			if(_entityVector && _entityVector.length > 0)
			{
				while(_entityVector[0])
				{
					removeEntity(_entityVector[0]);
				}
			}
			_entityVector = null;
		}
		
		public function dispose():void
		{
			
		}

		public function get bound():Rectangle
		{
			return _bound;
		}

		public function set bound(value:Rectangle):void
		{
			_bound = value;
		}

		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}

		
	}
}