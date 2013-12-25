package com.megagrand.mapedit.controller
{
	import com.megagrand.mapedit.model.MapProxy;
	import com.megagrand.mapedit.model.vo.FacadeNotification;
	import com.megagrand.mapedit.view.FileLibsPanelMediator;
	
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.system.ApplicationDomain;
	import flash.utils.Dictionary;
	
	import ghostcat.text.NumberUtil;
	import ghostcat.ui.layout.AbsoluteLayout;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Button;
	import mx.core.UIComponent;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import spark.components.Button;
	import spark.components.Label;
	import spark.components.List;
	import spark.components.TileGroup;

	/**
	 * 地图图元库加载完毕 
	 * @author Leo
	 * 
	 */	
	public class MapResourceCompleteCommand extends SimpleCommand implements ICommand
	{

		private var fileLibsPanelMediator :FileLibsPanelMediator;
		private var fileLibsList:TileGroup;
		public function MapResourceCompleteCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			
			var loaderInfo :LoaderInfo = notification.getBody() as LoaderInfo;
			var mapProxy :MapProxy = facade.retrieveProxy(MapProxy.NAME) as MapProxy;
			this.fileLibsPanelMediator = facade.retrieveMediator(FileLibsPanelMediator.NAME) as FileLibsPanelMediator;
			this.fileLibsList = fileLibsPanelMediator.fileLibPanel.fileLibsList;
			var mapResourceDict :Dictionary = mapProxy.mapResourceDict;
			for (var i:int = 1 ; ; i++)
			{
				//如果资源数小于2位数则在前面补个0
				var tileName:String = "map.Tile" + NumberUtil.fillZeros(i.toString(),2,"0");
				if(loaderInfo.applicationDomain.hasDefinition(tileName))
				{
					//从安全域中取出资源    
					var className :Class = loaderInfo.applicationDomain.getDefinition(tileName) as Class;
					var sp :Sprite = new className() as Sprite;
					var index :int = tileName.indexOf(".") + 1;
					var newName :String = tileName.substring(index);
					mapResourceDict[newName] = sp;
					var uc :UIComponent = new UIComponent();
					uc.toolTip = newName;
					uc.addEventListener(MouseEvent.CLICK,itemSelectHandler);
					uc.addChild(sp);
					uc.scaleX = .5;
					uc.scaleY = .5;
					fileLibsList.addElement(uc);
				} else
				{
					break;
				}
			}
			
			//发送初始化小地图通知
			sendNotification(FacadeNotification.MAP_INIT_VIEW,mapProxy);
		}
		
		private function itemSelectHandler(event :MouseEvent):void
		{
				sendNotification(FacadeNotification.SET_TILE,event.currentTarget.toolTip);
		}
	}
}