package com.megagrand.mapedit.view
{
	import com.megagrand.mapedit.view.ui.MapSettingPanel;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	/**
	 * 地图设置面板中介 
	 * @author leo
	 * 
	 */	
	public class MapSettingPanelMediator extends Mediator implements IMediator
	{
		public static const NAME :String = "MapSetPanelMediator";
		public function MapSettingPanelMediator( viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		public function get mapSettingPanel():MapSettingPanel
		{
			return this.viewComponent as MapSettingPanel;
		}
	}
}