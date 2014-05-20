package scene
{
	import ui.MapEditorController;

	public class WorkScene extends GameScene
	{
		private var _workController:MapEditorController;
		
		public function WorkScene()
		{
			super();
		}
		
		override protected function initController():void{
			_workController = new MapEditorController();
		}
	}
}