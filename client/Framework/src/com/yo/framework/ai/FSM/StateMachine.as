package com.yo.framework.ai.FSM
{
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
				currentState.execute();
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
		
		public function isInState(s:Class):Boolean {
			return currentState is s;
		}
		
		public function dispose():void {
			currentState && currentState.exit();
		}
	}
}