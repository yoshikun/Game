package ui.login
{
	import com.yo.manager.resource.ResourceManager;
	import com.yo.mvc.core.View;
	import com.yo.mvc.interfaces.IModel;
	
	import flash.display.MovieClip;
	
	public class LoginView extends View
	{
		public function LoginView(model:IModel)
		{
			super(model);
		}
		
		override protected function initView():void{
			super.initView();
			
			_asset = ResourceManager.instance.create("login.MainAsset") as MovieClip;
			this.addChild(_asset);
		}
	}
}