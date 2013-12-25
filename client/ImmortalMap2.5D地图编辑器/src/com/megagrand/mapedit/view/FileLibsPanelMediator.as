package com.megagrand.mapedit.view
{
	import com.megagrand.mapedit.view.ui.FileLibsPanel;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	/**
	 * 图元库面板中介 
	 * @author Leo
	 * 
	 */	
	public class FileLibsPanelMediator extends Mediator implements IMediator
	{
		public static const NAME :String = "FileLibsPanelMediator";
		public function FileLibsPanelMediator( viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		public function get fileLibPanel():FileLibsPanel
		{
			return this.viewComponent as FileLibsPanel;
		}
	}
}