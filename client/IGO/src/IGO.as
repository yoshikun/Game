package
{
	import com.yo.core.Game;
	import com.yo.logger.Log;
	
	import flash.display.Bitmap;
	
	import core.Config;
	
	import enum.State;
	
	import scene.SceneManager;
	import scene.SceneStateCreator;
	
	[SWF(width="1000", height="600", frameRate="60", backgroundColor="#0")]
	public class IGO extends Game
	{
		[Embed(source="map.jpg")]
		private var Map:Class;
		
		public function IGO()
		{
			var bitmap:Bitmap = new Map() as Bitmap;
			this.addChild(bitmap);
		}
		
		override protected function initModel():void{
			super.initModel();
			
			Config.stage = stage;
			
			Log.getLog(this).debug("初始化数据");
		}
		
		override protected function initManager():void{
			super.initManager();
			
			SceneManager.instance.setup(new SceneStateCreator());
			
//			SceneManager.instance.changeState(State.LOGIN_SCENE);
			SceneManager.instance.changeState(State.TEST_SCENE);
		}
		
		override protected function update():void
		{
			SceneManager.instance.update();
		}
	}
}