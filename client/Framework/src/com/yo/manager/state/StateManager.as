package com.yo.manager.state
{

	/**
	 * 状态机
	 */	
	public class StateManager implements IStateManager
	{
		protected var _owner:*;
		
		protected var _stateCreator:IStateCreator;
		
		protected var _currentState:IState;
		
		public function StateManager(owner:* = null)
		{
			_owner = owner;
		}
		
		public function setup(stateCreator:IStateCreator):void{
			_stateCreator = stateCreator;
		}
		
		public function update():void
		{
			if(_currentState){
				_currentState.update();
			}
		}
		
		public function changeState(name:String):void
		{
			if(!_stateCreator){
				return;
			}
			var nextState:IState = _stateCreator.getState(name);
			
			if(!nextState || nextState == _currentState){
				return;
			}
			
			if(_currentState){
				_currentState.exit();
				_currentState = null;
			}
			
			_currentState = nextState;
			_currentState.enter();
		}
		
		public function get currentState():IState
		{
			return _currentState;
		}
	}
}