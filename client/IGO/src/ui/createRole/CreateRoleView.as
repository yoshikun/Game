package ui.createRole
{
	import com.yo.manager.resource.ResourceManager;
	import com.yo.manager.ui.UIManager;
	import com.yo.mvc.core.BaseView;
	import com.yo.mvc.interfaces.IModel;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	import enum.State;
	
	import scene.SceneManager;
	
	public class CreateRoleView extends BaseView
	{
		private var _roleMc:MovieClip;
		
		private var _enterBtn:SimpleButton;
		
		public function CreateRoleView(model:IModel=null)
		{
			super(model);
		}
		
		override protected function initView():void{
			_asset = ResourceManager.instance.create("CreateRole.MainAsset") as MovieClip;
			this.addChild(_asset);
			
			_roleMc = _asset["roleMc"];
			_roleMc.stop();
			
			_enterBtn = _asset["enterBtn"];
		}
		
		override protected function initEvent():void{
			super.initEvent();
			_enterBtn.addEventListener(MouseEvent.CLICK, __enterBtnClick);
		}
		
		private function __enterBtnClick(e:MouseEvent):void
		{
			SceneManager.instance.changeState(State.CITY_SCENE);
		}
		
		override public function show():void{
			super.show();
			
			UIManager.instance.addChild(this);
		}
	}
}