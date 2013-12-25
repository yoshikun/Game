package scene
{
	import com.yo.logger.Log;
	import com.yo.manager.layer.LayerManager;
	import com.yo.manager.state.IState;
	import com.yo.manager.ui.UIManager;
	
	/**
	 * 场景的Abstract父类
	 */	
	public class GameScene implements IState
	{
		private var _name:String;
		
		public function GameScene()
		{
		}
		
		public function enter():void
		{
			Log.getLog(this).debug("进入" + _name);
			
			initController();
			initEvent();
			initView();
		}
		
		protected function initController():void{
			
		}
		
		protected function initEvent():void{
			
		}
		
		protected function initView():void{
			
		}
		
		public function update():void
		{
		}
		
		public function exit():void
		{
			LayerManager.instance.clear();
			UIManager.instance.clear();
		}
		
		public function dispose():void
		{
		}

		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}
	}
}