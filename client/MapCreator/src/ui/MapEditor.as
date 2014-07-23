package ui
{
	import com.yo.framework.core.Game;
	import com.yo.framework.manager.InputManager;
	import com.yo.framework.manager.layer.LayerManager;
	import com.yo.framework.manager.resource.ResourceManager;
	import com.yo.framework.manager.ui.UIManager;
	
	import core.Config;
	
	import enum.State;
	
	import flash.events.Event;
	
	import manager.SceneCreator;
	import manager.SceneManager;
	
	public class MapEditor extends Game
	{
		public function MapEditor()
		{
			super();
		}
		
		override protected function __configLoadComplete(e:Event):void{
			var config:XML = new XML(_loader.data);
			Config.picturePath = config.picturePath;

			Config.stage = stage;
			
			super.__configLoadComplete(e);
		}
		
		override protected function init():void{
			super.init();
			
			SceneManager.instance.changeState(State.LOAD_SCENE);
		}
		
		override protected function initManager():void
		{
			super.initManager();
			ResourceManager.instance.setup(null);
			SceneManager.instance.setup(new SceneCreator());
			LayerManager.instance.setup(this);
			UIManager.instance.setup();
		}
	}
}