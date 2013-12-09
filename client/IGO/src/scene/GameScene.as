package scene
{
	import com.yo.manager.state.IState;
	
	/**
	 * 场景的Abstract父类
	 */	
	public class GameScene implements IState
	{
		public function GameScene()
		{
		}
		
		public function enter():void
		{
			initController();
			initEvent();
			initView();
		}
		
		protected function initController():void{
			
		}
		
		protected function initEvent():void{
			
		}
		
		protected function initView():void{
			
		}
		
		public function update():void
		{
		}
		
		public function exit():void
		{
		}
		
		public function dispose():void
		{
		}
	}
}