package com.yo.framework.objects.entity
{
	import com.yo.framework.interfaces.IAnimator;
	import com.yo.framework.interfaces.IComponent;
	import com.yo.framework.interfaces.IEntity;
	import com.yo.framework.interfaces.IRenderer;
	import com.yo.framework.objects.RenderState;
	import com.yo.framework.utils.Macro;
	import com.yo.framework.utils.Transfer;
	
	import flash.events.EventDispatcher;
	import flash.geom.Vector3D;
	
	/**
	 * 基本实体
	 */
	public class BaseEntity extends EventDispatcher implements IEntity
	{
		/**
		 * 名称 
		 */		
		public var name:String;
		
		/**
		 * 用于深度排序 
		 */		
		public var index:int;
		
		/**
		 * 位置 
		 */		
        public var position:Vector3D;
		
		public var registrationX:int;
		
		public var registrationY:int;
		
		protected var _renderer:IRenderer;
		
		protected var _animator:IAnimator;
		
		protected var _attackTarget:IEntity;
		
		protected var _visible:Boolean = true;
		
		/**
		 * 方向 
		 */		
		protected var _direction:int = 1;
		
		/**
		 * 所有组件 
		 */		
		protected var _components:Vector.<IComponent>;
		
		protected var _renderState:RenderState;
		
		public function BaseEntity() 
		{
			init();
		}
		
		protected function init():void {
			position = new Vector3D(0, 0, 0);
			_renderState = new RenderState();
			_components = new Vector.<IComponent>();
		}
		
        public function get visible():Boolean
        {
            return _visible;
        }

        public function set visible(value:Boolean):void
        {
            _visible = value;
            for each(var c:IComponent in _components)
			{
                c.visible = value;
            }
        }

		public function update():void
		{
            for each(var c:IComponent in _components)
			{
            	c.update();
            }
			
			if(animator)
			{
				animator.update();
			}
		}
        
        public function render():void
		{
            for each(var c:IComponent in _components)
			{
                c.render();
            }
			if(animator)
			{
				animator.render();
			}
			if(renderer)
			{
				renderer.render();
			}
        }
        
        public function checkCollide(nextPos:Vector3D):Boolean
        {
            return false;
        }
        
        /**
         * 增加组件 
         */        
        public function addComponent(component:IComponent):void 
		{
			if(component)
			{
				if(_components)
				{
					_components.push(component);
				}
			}
        }
        
        /**
         * 移除组件 
         */        
        public function removeComponent(c:IComponent):void 
		{
			if(_components)
			{
				var i:int = _components.indexOf(c);
				if(-1 != i) 
				{
					_components.splice(i, 1);
					c.dispose();
				}
			}
        }
		
		public function set direction(d:int):void 
		{
			_direction = d;
		}
		
		public function get direction():int
		{
			return _direction;
		}
        
        public function get flip():Boolean
		{
            return _direction == -1;
        }
		
		public function get dirty():Boolean
		{
			return true;
		}
		
		public function getRenderState():RenderState
		{
			var state:RenderState = _renderState;
			if(flip)
			{
				state.scaleX = -1;
				state.x = int(Transfer.instance.getScreenX(position.x));
				state.y = int(Transfer.instance.getScreenY(position.y, position.z));
				
				state.regX = registrationX;
				state.regY = -registrationY;
			}
			else
			{
				state.scaleX = 1;
				state.x = int(Transfer.instance.getScreenX(position.x));
				state.y = int(Transfer.instance.getScreenY(position.y, position.z)); 
				
				state.regX = -registrationX;
				state.regY = -registrationY;
			}
			state.dirty = dirty;
			return state;
		}
		
		public function dispose():void 
		{	
			Macro.saveDipose(renderer);
			Macro.saveDipose(animator);
			Macro.saveDipose(_renderState);
			
			if(_components)
			{
				for each(var component:IComponent in _components)
				{
					component.dispose();
				}
				_components = null;
			}
			renderer = null;
		}	

		public function get renderer():IRenderer
		{
			return _renderer;
		}

		public function set renderer(value:IRenderer):void
		{
			_renderer = value;
		}

		public function get animator():IAnimator
		{
			return _animator;
		}

		public function set animator(value:IAnimator):void
		{
			_animator = value;
		}

		public function get attackTarget():IEntity
		{
			return _attackTarget;
		}

		public function set attackTarget(value:IEntity):void
		{
			_attackTarget = value;
		}
	}
}