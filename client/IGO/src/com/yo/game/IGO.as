package com.yo.game
{
	import com.yo.framework.core.Game;
	import com.yo.framework.logger.Log;
	import com.yo.framework.manager.layer.LayerManager;
	import com.yo.framework.manager.resource.ResourceManager;
	import com.yo.framework.manager.ui.UIManager;
	import com.yo.game.core.Global;
	import com.yo.game.core.URLCreator;
	import com.yo.game.enum.SceneName;
	import com.yo.game.scene.GameSceneCreator;
	import com.yo.game.scene.GameSceneManager;
	
	[Frame(factoryClass="com.yo.game.core.PreLoader")]
	
	[SWF(width="1000", height="600", frameRate="30", backgroundColor="#0")]
	public class IGO extends Game
	{
		public function IGO()
		{
			super();
		}
		
		override protected function init():void{
			super.init();
			GameSceneManager.instance.changeScene(SceneName.LOGIN_SCENE);
		}
		
		override protected function initModel():void{
			super.initModel();
			
			Global.host = _config.host;
			Global.port = _config.port;
			Global.lang = _config.lang;
			Global.resourcePath = _config.resource;
			Global.encryptResourcePath = _config.encryptResource;
			Global.encrypt = Boolean(int(_config.encrypt));
			
			Global.stage = stage;
			
			var params:Object = loaderInfo.parameters;
			for(var param:String in params){
				Global[param] = params[param];
			}
			Log.getLog(this).debug(Global["debug"] ? "进入调试模式" : "");
		}
		
		override protected function initManager():void{
			super.initManager();
			
			ResourceManager.instance.setup(new URLCreator());
			GameSceneManager.instance.setup(new GameSceneCreator());
			LayerManager.instance.setup(this);
			UIManager.instance.setup();
		}
		
		override protected function update():void
		{
			GameSceneManager.instance.update();
		}
	}
}