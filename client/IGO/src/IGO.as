package
{
	import com.yo.core.Game;
	import com.yo.manager.layer.LayerManager;
	import com.yo.manager.resource.ResourceManager;
	import com.yo.manager.ui.UIManager;
	
	import flash.display.Bitmap;
	import flash.events.Event;
	
	import core.Config;
	import core.URLCreator;
	
	import enum.State;
	
	import scene.SceneManager;
	import scene.SceneStateCreator;
	
	[SWF(width="1000", height="600", frameRate="60", backgroundColor="#0")]
	public class IGO extends Game
	{
		[Embed(source="../../../resource/zh_cn/image/bg.jpg")]
		private var Map:Class;
		
		public function IGO()
		{
			var bitmap:Bitmap = new Map() as Bitmap;
//			this.addChild(bitmap);
		}
		
		override protected function initModel():void{
			super.initModel();
			
			Config.stage = stage;
		}
		
		override protected function initManager():void{
			super.initManager();
			
			ResourceManager.instance.setup(new URLCreator());
			SceneManager.instance.setup(new SceneStateCreator());
			LayerManager.instance.setup(this);
			UIManager.instance.setup();
		}
		
		override protected function initView():void{
			ResourceManager.instance.loadResource("config", "config", __configLoadComplete);
		}
		
		private function __configLoadComplete(e:Event):void
		{
			var config:XML = ResourceManager.instance.getResource("config", "config");
			
			Config.host = config.host;
			Config.port = config.port;
			Config.lang = config.lang;
			Config.resource = config.resource;
			Config.encryptResource = config.encryptResource;
			Config.encrypt = config.encrypt;
			
			ResourceManager.instance.clearLoader("config");
			
			SceneManager.instance.changeState(State.LOGIN_SCENE);
		}
		
		override protected function update():void
		{
			SceneManager.instance.update();
		}
	}
}