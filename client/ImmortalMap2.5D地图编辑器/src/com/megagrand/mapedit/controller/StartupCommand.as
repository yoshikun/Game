package com.megagrand.mapedit.controller
{
	
	import com.megagrand.mapedit.model.MapProxy;
	import com.megagrand.mapedit.model.vo.FacadeNotification;
	import com.megagrand.mapedit.view.FileLibsPanelMediator;
	import com.megagrand.mapedit.view.MapSettingPanelMediator;
	import com.megagrand.mapedit.view.MiniMapMediator;
	import com.megagrand.mapedit.view.SceneMapMediator;
	import com.megagrand.mapedit.view.ToolsPanelMediator;
	import com.megagrand.mapedit.view.ViewPanelMediator;
	import com.megagrand.mapedit.view.ui.MapSettingPanel;
	import com.megagrand.mapedit.view.ui.SceneMap;
	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	/**
	 * PureMVC启动命令 ，注册Proxy、Command、Mediator
	 * @author leo
	 * 
	 */	
	public class StartupCommand extends SimpleCommand implements ICommand
	{
		private var app :MapEdit;
		public function StartupCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			facade.registerProxy(new MapProxy());
			
			facade.registerCommand(FacadeNotification.UI_CONTROL_SETTING_MAP_DATA,MapSettingCommand);
			facade.registerCommand(FacadeNotification.UI_CONTROL_FILE_OPEN,OpenMapCommand);
			facade.registerCommand(FacadeNotification.UI_CONTROL_FILE_SAVE,SaveMapCommand);
			facade.registerCommand(FacadeNotification.MAP_RESOURCE_COMPLETE,MapResourceCompleteCommand);
			facade.registerCommand(FacadeNotification.UI_CONTROL_OUTPUT_MAP_TEXTURE,OutPutMapTextureCommand);
			facade.registerCommand(FacadeNotification.UI_CONTROL_OUTPUT_WALKABLE_AREA,OutputWalkableAreaCommand);
			facade.registerCommand(FacadeNotification.UI_CONTROL_RESTORE_MAP,RestoreMapCommand);
			
			this.app= notification.getBody() as MapEdit;
			facade.registerMediator(new ViewPanelMediator(app.viewPanel));
			var mapSettingPanel :MapSettingPanel = new MapSettingPanel();
			facade.registerMediator(new MapSettingPanelMediator(mapSettingPanel));
			facade.registerMediator(new ToolsPanelMediator(app.viewPanel.toolsPanel));
			facade.registerMediator(new SceneMapMediator(app.viewPanel.sceneMap));
			facade.registerMediator(new FileLibsPanelMediator(app.viewPanel.fileLibsPanle));
			
		}
	}
}