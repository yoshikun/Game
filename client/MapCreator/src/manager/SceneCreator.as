package manager
{
	import com.yo.framework.manager.state.IState;
	import com.yo.framework.manager.state.StateCreator;
	
	import enum.State;
	
	import scene.GameScene;
	import scene.LoadScene;
	import scene.WorkScene;
	
	public class SceneCreator extends StateCreator
	{
		public function SceneCreator()
		{
		}
		
		override public function getState(name:String):IState
		{
			var state:GameScene = new GameScene();
			
			switch(name){
				case State.LOAD_SCENE:
					state = new LoadScene();
					break;
				case State.WORK_SCENE:
					state = new WorkScene();
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