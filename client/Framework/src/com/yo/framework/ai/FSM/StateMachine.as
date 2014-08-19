package com.yo.framework.ai.FSM
{
	/**
	 * 有限状态机
	 * @author yoshikun
	 * 
	 */	
	public class StateMachine
	{
		public var owner:*;

		public var currentState:IState;
		
		protected var _prevState:IState;
		
		public function StateMachine(owner:*)
		{
			this.owner = owner;
		}
		
		public function update():void {
			if(currentState){
				currentState.excute();
			}
		}
		
		public function changeState(state:IState):void {
			_prevState = currentState;
			if(currentState){
				currentState.exit();
			}
			currentState = state;
			currentState.enter(owner);
		}
		
		public function revert():void {
			changeState(_prevState);
		}
		
		public function isInState(cls:Class):Boolean {
			return currentState is cls;
		}
		
		public function dispose():void {
			if(currentState)
			{
				currentState.exit();
			}
		}
	}
}