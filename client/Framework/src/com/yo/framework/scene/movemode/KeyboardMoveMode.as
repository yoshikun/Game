package com.yo.framework.scene.movemode
{
    import com.yo.framework.manager.InputManager;
    import com.yo.framework.objects.MovingEntity;
    import com.yo.framework.utils.Misc;
    import com.yo.framework.utils.Transfer;
    
    import flash.ui.Keyboard;

    /**
     * 键盘移动控制器 
     */    
    public class KeyboardMoveMode
	{
        private var _target:MovingEntity;
        
        public function KeyboardMoveMode(target:MovingEntity)
     	{
            _target = target;
        }
        
        public function update():void{
            if(!Misc.isTextFieldFocus()){
				//如果在攻击中，则返回
				if(!_target.canMove()){
					return;
				}
				
                //如果按下了方向键，之前的移动取消
                if(isKeyboardMoving())
				{
                    if(_target.movement)
					{
                        _target.stop();
                        _target.movement = null;
                    }
					(_target as Player).clearTarget();
                }
				
				if(isKeyDownArray([Keyboard.A, Keyboard.W], [Keyboard.LEFT, Keyboard.UP]))
				{
					_target.move(Transfer.angle(7));
				}
				else if(isKeyDownArray([Keyboard.A, Keyboard.S], [Keyboard.LEFT, Keyboard.DOWN]))
				{
					_target.move(Transfer.angle(5));
				}
				else if(isKeyDownArray([Keyboard.D, Keyboard.W], [Keyboard.RIGHT, Keyboard.UP]))
				{
					_target.move(Transfer.angle(1));
				}
				else if(isKeyDownArray([Keyboard.D, Keyboard.S], [Keyboard.RIGHT, Keyboard.DOWN]))
				{
					_target.move(Transfer.angle(3));
				}
				else if(isKeyDown(Keyboard.A, Keyboard.LEFT))
				{
					_target.move(Transfer.angle(6));
				}
				else if(isKeyDown(Keyboard.W, Keyboard.UP))
				{
					_target.move(Transfer.angle(0));
				}
				else if(isKeyDown(Keyboard.D, Keyboard.RIGHT))
				{
					_target.move(Transfer.angle(2));
				}
				else if(isKeyDown(Keyboard.S, Keyboard.DOWN))
				{
					_target.move(Transfer.angle(4));
				}
				else if(!_target.movement)
				{
					if(_target is Player){
						if(!(_target as Player).attackTarget)
						{
							_target.stop();
						}
					}
				}
            }
			else
			{
				if(!_target.movement)
				{
					if(_target is Player)
					{
						if(!(_target as Player).attackTarget)
						{
							_target.stop();
						}
					}
				}
			}
        }
        
        public function isKeyboardMoving():Boolean{
            if((!isKeyDown(Keyboard.A, Keyboard.LEFT) && 
				!isKeyDown(Keyboard.D, Keyboard.RIGHT) && 
				!isKeyDown(Keyboard.W, Keyboard.UP) && 
				!isKeyDown(Keyboard.S, Keyboard.DOWN)))
			{
                return false;
            }
            return true;
        }
		
		private function isKeyDown(key:uint, key2:int = -1):int{
			if(key2 != -1){
				return InputManager.instance.keyDown(key) || InputManager.instance.keyDown(key2);
			}
			return InputManager.instance.keyDown(key);
		}
		
		private function isKeyDownArray(keyArray:Array, keyArray2:Array = null):Boolean{
			if(keyArray2 != null){
				return InputManager.instance.keyDownArray(keyArray) || InputManager.instance.keyDownArray(keyArray2);
			}
			return InputManager.instance.keyDownArray(keyArray);
		}
		
	}
}