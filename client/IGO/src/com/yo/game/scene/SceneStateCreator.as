package com.yo.game.scene
{
	import com.yo.framework.manager.state.IState;
	import com.yo.framework.manager.state.StateCreator;
	import com.yo.game.enum.State;
	
	public class SceneStateCreator extends StateCreator
	{
		public function SceneStateCreator()
		{
			
		}
		
		override protected function initialize():void{
			
		}
		
		override public function getState(name:String):IState{
			var state:IState = null;
			switch(name)
			{
				case State.LOAD_SCENE:
					state = new LoadScene();
					break;
				case State.LOGIN_SCENE:
					state = new LoginScene();
					break;
				case State.CITY_SCENE:
					state = new CityScene();
					break;
				case State.CREATE_ROLE:
					state = new CreateRoleScene();
					break;
				default:
					break;
			}
			if(state){
				state.name = name;
			}
			return state;
		}
		
		override public function dispose():void
		{
		}
	}
}