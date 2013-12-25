package com.megagrand.mapedit.view
{
	import com.megagrand.mapedit.view.ui.ViewPanel;
	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;

	/**
	 * 整个视图面板中介，负责隐藏和显示各个小面板和注册小地图中介 
	 * @author leo
	 * 
	 */	
	public class ViewPanelMediator extends Mediator implements IMediator
	{
		public static const NAME :String = "ViewPanelMediator";
		
		private var toolsCurState :Boolean = true;
		private var miniMapCurState :Boolean = true;
		private var imgLibsCurState :Boolean = true;
		private var specialCurState :Boolean = true;
		
		public function ViewPanelMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			
			this.viewPanel.btnHideTools.addEventListener(MouseEvent.CLICK,btnToolsHandler);
			this.viewPanel.btnHideMiniMap.addEventListener(MouseEvent.CLICK,btnMiniMapHandler);
			this.viewPanel.btnHideImgLibs.addEventListener(MouseEvent.CLICK,btnImgLibsHandler);
			this.viewPanel.btnHideSpecial.addEventListener(MouseEvent.CLICK,btnSpecialHandler);
			
		}
		/**
		 * 注册小地图中介 
		 */		
		public override function onRegister():void
		{
			super.onRegister();
			
			facade.registerMediator(new MiniMapMediator(viewPanel.miniMapPanel.miniMap));
		}
		
		public function get viewPanel():ViewPanel
		{
			return this.viewComponent as ViewPanel;
		}
		/**隐藏显示工具栏*/
		private function btnToolsHandler(event :MouseEvent):void
		{
			if(toolsCurState == true)
			{
				this.viewPanel.toolsPanel.visible = false;
				this.viewPanel.btnHideTools.label = "显示工具栏";
				this.toolsCurState = false;
			} else
			{
				this.viewPanel.toolsPanel.visible = true;
				this.viewPanel.btnHideTools.label = "隐藏工具栏";
				this.toolsCurState = true;
			}
		}
		/**隐藏显示小地图*/
		private function btnMiniMapHandler(event :MouseEvent):void
		{
			if(miniMapCurState == true)
			{
				this.viewPanel.miniMapPanel.visible = false;
				this.viewPanel.btnHideMiniMap.label = "显示小地图";
				this.miniMapCurState = false;
			} else
			{
				this.viewPanel.miniMapPanel.visible = true;
				this.viewPanel.btnHideMiniMap.label = "隐藏小地图";
				this.miniMapCurState = true;
			}
		}
		/**隐藏显示图库*/
		private function btnImgLibsHandler(event :MouseEvent):void
		{
			if(imgLibsCurState == true)
			{
				this.viewPanel.fileLibsPanle.visible = false;
				this.viewPanel.btnHideImgLibs.label = "显示图库";
				this.imgLibsCurState = false;
			} else
			{
				this.viewPanel.fileLibsPanle.visible = true;
				this.viewPanel.btnHideImgLibs.label = "隐藏图库";
				this.imgLibsCurState = true;
			}
		}
		/**隐藏显示特殊区域*/
		private function btnSpecialHandler(event :MouseEvent):void
		{
			if(specialCurState == true)
			{
				this.viewPanel.specialAreaPanel.visible = false;
				this.viewPanel.btnHideSpecial.label = "显示特殊区域";
				this.specialCurState = false;
			} else
			{
				this.viewPanel.specialAreaPanel.visible = true;
				this.viewPanel.btnHideSpecial.label = "隐藏特殊区域";
				this.specialCurState = true;
			}
		}
		
	}
}