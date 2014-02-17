package ui
{
	import com.yo.core.Game;
	import com.yo.manager.InputManager;
	import com.yo.manager.layer.LayerManager;
	import com.yo.manager.resource.ResourceManager;
	import com.yo.manager.ui.UIManager;
	
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