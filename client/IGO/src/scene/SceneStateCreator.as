package scene
{
	import com.yo.manager.state.IState;
	import com.yo.manager.state.StateCreator;
	
	import enum.State;
	
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