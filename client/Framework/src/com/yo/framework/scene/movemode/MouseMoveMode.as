package com.yo.framework.scene.movemode
{
    import com.yo.framework.core.FP;
    import com.yo.framework.interfaces.IEntity;
    import com.yo.framework.manager.SoundManager;
    import com.yo.framework.objects.MovingEntity;
    
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.utils.getTimer;

    public class MouseMoveMode
    {
        private var _container:Sprite;
		
        private var _autoMoveMode:Boolean = false;
		
        private var _autoMoveStartTime:int;
		
        private var _checkAutoMove:Boolean = false;
		
        private var _autoMoveAngle:Number;
		
        private var _lastAutoMoveTime:int;
		
        private var _target:MovingEntity;
		
        private var _callback:Function;
		
		public const AUTOMOVE_DELTA:int = 100;
		
		public const AUTOMOVE_DELAY:int = 500;
        
        public function MouseMoveMode(target:IEntity, container:flash.display.Sprite, callback:Function)
        {
			_container.addEventListener(MouseEvent.MOUSE_DOWN, __mouseDownHandler);
			_container.addEventListener(MouseEvent.CLICK, __clickHandler);
            FP.stage.addEventListener(MouseEvent.MOUSE_UP, __mouseUpHandler);
            
            _target = target;
            _container = container;
            _callback = callback;
        }
		
        public function update():void {
            //如果长按超过500毫秒，进入自动移动模式 
            if(_checkAutoMove && (getTimer() - _autoMoveStartTime) > AUTOMOVE_DELAY)
			{
                _autoMoveMode = true;
                _checkAutoMove = false;
            }
            //自动移动模式间隔为100毫秒，防止计算过多
            if(_autoMoveMode && getTimer() - _lastAutoMoveTime >= AUTOMOVE_DELTA)
			{   
                if(_callback != null && _target.canMove())
				{
                    _callback();
                    _lastAutoMoveTime = getTimer();
                }
            } 
        }
        
        protected function __mouseUpHandler(event:MouseEvent):void
        {
            _checkAutoMove = false;
            if(_autoMoveMode)
			{
                _autoMoveMode = false;
            }
        }
        
        protected function __mouseDownHandler(event:MouseEvent):void
        {
            _autoMoveStartTime = getTimer();
            _checkAutoMove = true;
        }
        
        protected function __clickHandler(event:MouseEvent):void
        {
            if(_callback != null && _target.canMove())
			{
                _callback();
                SoundManager.instance.play("Event_PlayerMove");
            }
        }
        
        public function dispose():void {
            _container.removeEventListener(MouseEvent.MOUSE_DOWN, __mouseDownHandler);
            _container.removeEventListener(MouseEvent.CLICK, __clickHandler);
            FP.stage.removeEventListener(MouseEvent.MOUSE_UP, __mouseUpHandler);
        }
    }
}