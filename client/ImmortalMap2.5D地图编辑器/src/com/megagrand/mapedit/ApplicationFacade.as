package com.megagrand.mapedit
{
	import com.megagrand.mapedit.controller.StartupCommand;
	import com.megagrand.mapedit.model.vo.FacadeNotification;
	
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	/**
	 * 启动pureMVC 
	 * @author leo
	 * 
	 */	
	public class ApplicationFacade extends Facade implements IFacade
	{
		public function ApplicationFacade()
		{
			super();
		}
		
		public static function getInstance():ApplicationFacade
		{
			return (instance ||= new ApplicationFacade) as ApplicationFacade;
		}

		public function startup(mapEdit:MapEdit):void
		{
			sendNotification(FacadeNotification.APP_START_UP,mapEdit);
		}
		
		protected override function initializeController():void
		{
			super.initializeController();
			
			registerCommand(FacadeNotification.APP_START_UP,StartupCommand);
		}
		
	}
}