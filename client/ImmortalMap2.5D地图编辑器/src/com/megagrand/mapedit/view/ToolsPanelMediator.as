package com.megagrand.mapedit.view
{
	import com.megagrand.mapedit.model.vo.FacadeNotification;
	import com.megagrand.mapedit.view.ui.ToolsPanel;
	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	import mx.controls.Button;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;

	/**
	 *  工具面板Mediator
	 * @author leo
	 * 
	 */	
	public class ToolsPanelMediator extends Mediator implements IMediator
	{
		public static const NAME :String = "ToolsPanelMediator";
		
		public function ToolsPanelMediator( viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			
			this.toolsPanel.btnCreate.addEventListener(MouseEvent.CLICK,btnHandler);
			this.toolsPanel.btnOpen.addEventListener(MouseEvent.CLICK,btnHandler);
			this.toolsPanel.btnSave.addEventListener(MouseEvent.CLICK,btnHandler);
			this.toolsPanel.btnMove.addEventListener(MouseEvent.CLICK,btnHandler);
			this.toolsPanel.btnDelete.addEventListener(MouseEvent.CLICK,btnHandler);
			this.toolsPanel.btnBrush.addEventListener(MouseEvent.CLICK,btnHandler);
			this.toolsPanel.btnDrop.addEventListener(MouseEvent.CLICK,btnHandler);
			this.toolsPanel.btnZoomout.addEventListener(MouseEvent.CLICK,btnHandler);
			this.toolsPanel.btnZoomin.addEventListener(MouseEvent.CLICK,btnHandler);
			this.toolsPanel.btnPathAdd.addEventListener(MouseEvent.CLICK,btnHandler);
			this.toolsPanel.btnPathDelete.addEventListener(MouseEvent.CLICK,btnHandler);
			this.toolsPanel.btnReset.addEventListener(MouseEvent.CLICK,btnHandler);
			this.toolsPanel.btnClearBrush.addEventListener(MouseEvent.CLICK,btnHandler);
			this.toolsPanel.btnResetPosition.addEventListener(MouseEvent.CLICK,btnHandler);
			this.toolsPanel.btnHidePath.addEventListener(MouseEvent.CLICK,btnHandler);
			this.toolsPanel.btnPathPointAdd.addEventListener(MouseEvent.CLICK,btnHandler);
			this.toolsPanel.btnOutputMapTexture.addEventListener(MouseEvent.CLICK,btnHandler);
			this.toolsPanel.btnOutputWalkableArea.addEventListener(MouseEvent.CLICK,btnHandler);
			this.toolsPanel.btnHideGrid.addEventListener(MouseEvent.CLICK,btnHandler);
			//增加快捷键
			this.toolsPanel.addEventListener(Event.ADDED_TO_STAGE,addToStageHandler);
		}
		
		public function get toolsPanel():ToolsPanel
		{
			return this.viewComponent as ToolsPanel;
		}
		
		private function btnHandler(event :MouseEvent):void
		{
			switch(event.currentTarget.id)
			{
				case "btnCreate" :
					sendNotification(FacadeNotification.UI_CONTROL_SETTING_MAP_DATA);
//					trace(event.currentTarget.id);
					break;
				case "btnOpen" :
					sendNotification(FacadeNotification.UI_CONTROL_FILE_OPEN);
//					trace(event.currentTarget.id);
					break;
				case "btnSave" :
					sendNotification(FacadeNotification.UI_CONTROL_FILE_SAVE);
//					trace(event.currentTarget.id);
					break;
				case "btnMove" :
					sendNotification(FacadeNotification.UI_CONTROL_MOUSE_MOVE);
//					trace(event.currentTarget.id);
					break;
				case "btnDelete" :
					sendNotification(FacadeNotification.UI_CONTROL_DELETE);
//					trace(event.currentTarget.id);
					break;
				case "btnBrush" :
					sendNotification(FacadeNotification.UI_CONTROL_BRUSH);
//					trace(event.currentTarget.id);
					break;
				case "btnDrop" :
					sendNotification(FacadeNotification.UI_CONTROL_DROP);
//					trace(event.currentTarget.id);
					break;
				case "btnZoomout" :
					sendNotification(FacadeNotification.UI_CONTROL_ZOOMOUT);
//					trace(event.currentTarget.id);
					break;
				case "btnZoomin" :
					sendNotification(FacadeNotification.UI_CONTROL_ZOOMIN);
//					trace(event.currentTarget.id);
					break;
				case "btnReset" :
					sendNotification(FacadeNotification.UI_CONTROL_RESET);
//					trace(event.currentTarget.id);
					break;
				case "btnPathAdd" :
					sendNotification(FacadeNotification.UI_CONTROL_PATH_ADD);
//					trace(event.currentTarget.id);
					break;
				case "btnPathDelete" :
					sendNotification(FacadeNotification.UI_CONTROL_PATH_DELETE);
//					trace(event.currentTarget.id);
					break;
				case "btnClearBrush" :
					sendNotification(FacadeNotification.UI_CONTROL_CLEAR_BRUSH);
//					trace(event.currentTarget.id);
					break;
				case "btnResetPosition" :
					sendNotification(FacadeNotification.UI_CONTROL_RESET_POSITION);
//					trace(event.currentTarget.id);
					break;
				case "btnHidePath":
					sendNotification(FacadeNotification.UI_CONTROL_HIDE_PATH,event.currentTarget);
//					trace(event.currentTarget.id);
					break;
				case "btnPathPointAdd":
					sendNotification(FacadeNotification.UI_CONTROL_PATHPOINT_ADD);
//					trace(event.currentTarget.id);
					break;
				case "btnOutputMapTexture":
					sendNotification(FacadeNotification.UI_CONTROL_OUTPUT_MAP_TEXTURE);
//					trace(event.currentTarget.id);
					break;
				case "btnOutputWalkableArea":
					sendNotification(FacadeNotification.UI_CONTROL_OUTPUT_WALKABLE_AREA);
//					trace(event.currentTarget.id);
					break;
				case "btnHideGrid":
					sendNotification(FacadeNotification.UI_CONTROL_HIDE_GRID,event.currentTarget);
//					trace(event.currentTarget.id);
					break;
			}
		}
		
		/**
		 * 加入到舞台
		 */		
		private function addToStageHandler(event :Event):void
		{
			this.toolsPanel.stage.addEventListener(KeyboardEvent.KEY_UP,keyHandler);
			this.toolsPanel.removeEventListener(Event.ADDED_TO_STAGE,addToStageHandler);
		}
		/**
		 * 快捷键
		 */		
		private function keyHandler(event :KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case Keyboard.Z :
					//z键清除刷子
					sendNotification(FacadeNotification.UI_CONTROL_CLEAR_BRUSH);
					break;
				case Keyboard.X :
					//x键手套工具，拖动
					sendNotification(FacadeNotification.UI_CONTROL_DROP);
					break;
				case Keyboard.C :
					//c键增加路径点
					sendNotification(FacadeNotification.UI_CONTROL_PATHPOINT_ADD);
					break;
				case Keyboard.V :
					//v键删除物品
					sendNotification(FacadeNotification.UI_CONTROL_DELETE);
					break;
			}
		}
	}
}