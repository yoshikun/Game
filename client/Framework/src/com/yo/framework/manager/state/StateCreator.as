package com.yo.framework.manager.state
{
	public class StateCreator implements IStateCreator
	{
		public function StateCreator()
		{
			initialize();
		}
		
		protected function initialize():void{
			
		}
		
		public function getState(name:String):IState
		{
			return null;
		}
		
		public function dispose():void
		{
		}
	}
}