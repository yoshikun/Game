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
            if(!Misc.isTextFieldFocus())
			{
				//如果在攻击中，则返回
				if(!_target.canMove())
				{
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

				}
            }
			else
			{
				if(!_target.movement)
				{
					
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
		
		private function isKeyDown(...args):Boolean{
			var isDown:Boolean = false;
			var len:int = args.length;
			for (var i:int = 0; i < len; i++) 
			{
				isDown = InputManager.instance.keyDown(args[i]);
				if(isDown)
				{
					break;
				}
			}
			return isDown;
		}
		
		private function isKeyDownArray(...args):Boolean{
			var isDown:Boolean = false;
			var len:int = args.length;
			for (var i:int = 0; i < len; i++) 
			{
				isDown = InputManager.instance.keyDownArray(args[i]);
				if(isDown)
				{
					break;
				}
			}
			return isDown;
		}
		
	}
}