package scene
{
	import ui.WorkController;

	public class WorkScene extends GameScene
	{
		private var _workController:WorkController;
		
		public function WorkScene()
		{
			super();
		}
		
		override protected function initController():void{
			_workController = new WorkController();
		}
	}
}