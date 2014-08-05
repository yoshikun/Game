package com.yo.game.ui.createRole
{
	import com.yo.framework.manager.resource.ResourceManager;
	import com.yo.framework.manager.ui.UIManager;
	import com.yo.framework.mvc.core.BaseView;
	import com.yo.framework.mvc.interfaces.IModel;
	import com.yo.game.enum.Scene;
	import com.yo.game.scene.GameSceneManager;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
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
			GameSceneManager.instance.changeScene(Scene.CITY_SCENE);
		}
		
		override public function show():void{
			super.show();
			
			UIManager.instance.addChild(this);
		}
	}
}