package ui
{
	import com.yo.manager.ui.UIManager;
	import com.yo.mvc.core.BaseController;
	
	public class WorkController extends BaseController
	{
		public function WorkController()
		{
			super();
		}
		
		override protected function init():void{
			super.init();
			
			_resourceLoaded = true;
			
			show();
		}
		
		override protected function initModel():void{
			_model = new WorkModel();
		}
		
		override protected function initView():void{
			_view = new WorkView(_model);
		}
	}
}