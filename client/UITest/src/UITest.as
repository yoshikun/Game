package
{
	import com.yo.core.Game;
	
	import fl.managers.SkinManager;
	
	public class UITest extends Game
	{
		public function UITest()
		{
			super();
		}
		
		override protected function initManager():void{
			super.initManager();
			
			SkinManager.instance.setup();
		}
		
		override protected function initView():void{
			super.initView();
			
		}
	}
}