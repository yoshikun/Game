package
{
	import com.yo.core.Game;
	import com.yo.logger.Log;
	import com.yo.manager.layer.LayerManager;
	import com.yo.manager.resource.ResourceManager;
	import com.yo.manager.ui.UIManager;
	
	import core.Config;
	import core.URLCreator;
	
	import enum.State;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import scene.SceneManager;
	import scene.SceneStateCreator;
	
	[SWF(width="1000", height="600", frameRate="60", backgroundColor="#0")]
	public class IGO extends Game
	{
		public function IGO()
		{
			super();
		}
		
		override protected function __configLoadComplete(e:Event):void
		{
			var config:XML = new XML(_loader.data);
			Config.host = config.host;
			Config.port = config.port;
			Config.lang = config.lang;
			Config.resource = config.resource;
			Config.encryptResource = config.encryptResource;
			Config.encrypt = Boolean(int(config.encrypt));
			
			super.__configLoadComplete(e);
		}
		
		override protected function init():void{
			super.init();
			SceneManager.instance.changeState(State.LOGIN_SCENE);
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
		
		override protected function update():void
		{
			SceneManager.instance.update();
		}
	}
}