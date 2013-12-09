package com.yo.manager.state
{

	public class StateManager implements IStateManager
	{
		protected var _owner:*;
		
		protected var _stateCreator:IStateCreator;
		
		protected var _currentState:IState;
		
		protected var _currentStateName:String;
		
		protected var _data:Object;
		
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
		
		public function changeState(name:String, data:Object = null):void
		{
			var nextState:IState = _stateCreator.getState(name);
			_data = data;
			
			if(!nextState || nextState == _currentState){
				return;
			}
			
			if(_currentState){
				_currentState.exit();
			}
			
			_currentState = nextState;
			_currentState.enter();
			
			_currentStateName = name;
		}
		
		public function get currentState():IState
		{
			return _currentState;
		}

		public function get currentStateName():String
		{
			return _currentStateName;
		}
	}
}