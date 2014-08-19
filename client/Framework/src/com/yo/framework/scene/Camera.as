package com.yo.framework.scene
{
    import com.yo.framework.core.FP;
    import com.yo.framework.interfaces.IEntity;
    import com.yo.framework.objects.RenderState;
    import com.yo.framework.utils.Interpolation;
    import com.yo.framework.utils.MathUtil;
    
    import flash.geom.Point;
    import flash.geom.Rectangle;
    
    public class Camera
    {
		public var zoomMin:Number;
		
		public var zoomMax:Number;
		
		/**
		 * 镜头位置 
		 */        
		public var x:Number;
		
		public var y:Number;
		
        private var _zoom:Number;
		
        private var _target:IEntity;
		
        private var ticks:Number = 0;
		
        private var startScrollX:Number;
		
        private var startScrollY:Number;
		
        private var nowPoint:Point;
		
        private var _shakeY:Number
		
        private var _shakeX:Number;
		
        private var _shakeDuration:Number;
		
        private var _shakeStartX:Number;
		
        private var _shakeStartY:Number;
        
        private var _width:Number;
		
        private var _height:Number;
        
		/**
		 * 摄像机的照射位置，位于世界坐标哪里 
		 */        
        private var _scrollX:Number;
		
        private var _scrollY:Number;
        
		/**
		 * 摄像机边界 
		 */        
        public var bound:Rectangle;
		
        private var _smooth:Boolean;
		
		private var _targetPoint:Point;
		
		/**
		 * 滚动差值中间变量 
		 */		
		private var _startScrollTick:int;
		
		private var _totalScrollTick:int;
		
		private var _startScrollPos:Point;
		
		private var _callback:Function;
		
		private var _smoothFactor:Number = 1;
		
		private var _shakeTotalDuration:Number;
		
		private var _shakeTotalAngle:Number;
		
		private var _shakeIntensity:Number;
        
        public function Camera(w:Number, h:Number)
        {
            x = 0;
            y = 0;
			zoomMin = -1;
			zoomMax = int.MAX_VALUE;
			
            _width = w;
            _height = h;
            _scrollX = w / 2;
            _scrollY = h / 2;
            _zoom = 1;
            _smooth = false;
            _shakeDuration = 0;
        }

        public function get height():Number
        {
            return _height;
        }

        public function set height(value:Number):void
        {
            _height = value;
        }

        public function get width():Number
        {
            return _width;
        }

        public function set width(value:Number):void
        {
            _width = value;
        }

        public function get smooth():Boolean
        {
            return _smooth;
        }

        public function set smooth(value:Boolean):void
        {
            _smooth = value;
        }
        
        public function get left():Number {
            return _scrollX - width / 2 / zoom;
        }
        
        public function get top():Number {
            return _scrollY - height / 2 / zoom;
        }
        
        public function get right():Number {
            return _scrollX + width / 2 / zoom;
        }
        
        public function get bottom():Number {
            return _scrollY + height / 2 / zoom;
        }

        public function get scrollX():Number
        {
            return _scrollX;
        }

        public function set scrollX(value:Number):void
        {
            if (_scrollX == value) {
                return;
            }
            _scrollX = value;
        }

        public function get scrollY():Number
        {
            return _scrollY;
        }

        public function set scrollY(value:Number):void
        {
            if (_scrollY == value) {
                return;
            }
            _scrollY = value;
        }
		
		public function scrollTo(p:Point, duration:int, callback:Function = null):void {
			_target = null;
			_targetPoint = p;
			_startScrollTick = 0;
			_totalScrollTick = duration;
			_startScrollPos = new Point(_scrollX, _scrollY);
			_callback = callback;
		}

        public function follow(target:IEntity, smoothFactor:Number = 1):void
        {
			_targetPoint = null;
            _target = target;
            _smoothFactor = smoothFactor;
        }
        
        public function shake(duration:Number = 2, intensity:Number = 10):void
        {
            _shakeDuration = duration;
            _shakeStartX = scrollX;
            _shakeStartY = scrollY;
			_shakeIntensity = intensity <= 0 ? 10 : intensity;
			_shakeTotalDuration = duration;
			_shakeTotalAngle = Math.PI * MathUtil.randf(20, 30);
        }
        
        public function focus(pos:Point):void
        {
            scrollX = pos.x;
            scrollY = pos.y;
        }
        
        public function set zoom(z:Number):void
        {
            if(z <= 0)
            {
                return;
            }
            if(z < zoomMin)
            {
                z = zoomMin;
            }
            if(z > zoomMax)
            {
                z = zoomMax;
            }
            _zoom = z;
        }
        
        public function get zoom():Number
        {
            return _zoom;
        }
        
        public function update():void
        {
            if(_target)
            {
				var state:RenderState = _target.getRenderState();
                _scrollX -= (_scrollX - state.x) * _smoothFactor;
                _scrollY -= (_scrollY - state.y) * _smoothFactor;
				state.dispose();
				
				if (_shakeDuration > 0) {
					_shakeStartX = scrollX;
					_shakeStartY = scrollY;
				}
            }
			var k:Number;
			
			if(_targetPoint)
			{
				_startScrollTick += FP.elapsed;
				if(_totalScrollTick == 0)
				{
					k = 1;
				}
				else
				{
					k = _startScrollTick / _totalScrollTick;
				}
				_scrollX = Interpolation.linearInterpolateLock(_startScrollPos.x, _targetPoint.x, k);
				_scrollY = Interpolation.linearInterpolateLock(_startScrollPos.y, _targetPoint.y, k);

				if(k >= 1)
				{
					_targetPoint = null;
					if(_callback != null)
					{
						_callback();
					}
				}
			}
            
            if(_shakeDuration > 0)
            {
                _shakeDuration -= FP.elapsed;
                if(_shakeDuration <= 0)
				{
					_scrollX = _shakeStartX;
					_scrollY = _shakeStartY;
                    _shakeX = 0;
                    _shakeY = 0;
                }
				
				// 完全随机不太好看
//                _shakeX = Math.random() * 0.01 * width * 2 - 0.01 * width;
//                _shakeY = Math.random() * 0.01 * height * 2 - 0.01 * height;
				// 圆形震动，弧形减弱
				k = _shakeDuration / _shakeTotalDuration;
				var t:Number = Interpolation.linearInterpolateLock(0, _shakeTotalAngle, k);
				_shakeX = _shakeIntensity * k * Math.cos(t * _shakeTotalAngle);
				_shakeY = _shakeIntensity * k * Math.sin(t * _shakeTotalAngle);
				_scrollX = _shakeStartX + _shakeX;
				_scrollY = _shakeStartY + _shakeY;
            }
            

            // 如果有边界，将摄像机的范围限制在边界内
            if(bound)
            {
				_scrollX = Math.min(Math.max(bound.x + width / 2 / zoom, _scrollX), bound.x + bound.width - width / 2 / zoom);
				_scrollY = Math.min(Math.max(bound.y + height / 2 / zoom, _scrollY), bound.y + bound.height - height / 2 / zoom);
            }
        }
    }
}