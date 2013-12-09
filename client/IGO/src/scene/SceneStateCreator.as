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
			switch(name)
			{
				case State.LOAD_SCENE:
					return new LoadScene(); 
				case State.LOGIN_SCENE:
					return new LoginScene();
				case State.CITY_SCENE:
					return new CityScene();
				default:
					return null;
			}
			return null;
		}
		
		override public function dispose():void
		{
		}
	}
}