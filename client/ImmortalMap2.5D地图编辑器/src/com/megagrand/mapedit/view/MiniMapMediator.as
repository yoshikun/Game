package com.megagrand.mapedit.view
{
	import com.megagrand.mapedit.model.MapProxy;
	import com.megagrand.mapedit.model.vo.FacadeNotification;
	import com.megagrand.mapedit.model.vo.MapVO;
	import com.megagrand.mapedit.view.ui.MiniMap;
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import ghostcat.events.OperationEvent;
	import ghostcat.manager.AssetManager;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class MiniMapMediator extends Mediator implements IMediator
	{
		public static const NAME :String = "MiniMapMediator";
		public static var WIDTH:Number = 0;
		public static var HEIGHT:Number = 0;
		
		public var mapVO:MapVO;
		
		public function MiniMapMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		public override function onRegister():void
		{
			super.onRegister();
			
			// 测试数据
//			AssetManager.instance.loadResource("map.swf","map.swf").addEventListener(OperationEvent.OPERATION_COMPLETE,load);
		}
		
		private function load(e:Event):void
		{
			var mapProxy:MapProxy = facade.retrieveProxy(MapProxy.NAME) as MapProxy;
			var vo:MapVO = new MapVO();
			vo.width = 10;
			vo.height = 10;
			vo.tileWidth = 70;
			vo.tileHeight = 35;
			mapProxy.createMap(vo);
			
			for(var i:int = 0; i < 9999; i++)
			{
				var x:int=vo.width * Math.random();
				var y:int=vo.height *Math.random();
				var t:int = 1+8 * Math.random();
				vo.tilesTypeAry[y][x] = t;
			}
			
			this.sendNotification(FacadeNotification.MAP_INIT_VIEW,vo);
		}
		
		public override function listNotificationInterests():Array
		{
			return [
				FacadeNotification.MAP_INIT_VIEW,
				FacadeNotification.MAP_TILE_UPDATE,
				FacadeNotification.MAP_CHANGE_LOCAL,
				FacadeNotification.MAP_ZOOM_IN,
				FacadeNotification.MAP_ZOOM_OUT
				];
		}
		
		public override function handleNotification(notification:INotification):void
		{
			switch(notification.getName())
			{
				case FacadeNotification.MAP_INIT_VIEW:
					var mapProxy:MapProxy = notification.getBody() as MapProxy;
					mapVO = mapProxy.mapVO;
					if(WIDTH == 0)
					{
						WIDTH = miniMap.width;
						HEIGHT = miniMap.height;
					}
					miniMap.initMiniMap(mapProxy,WIDTH,HEIGHT);
					break;
				case FacadeNotification.MAP_TILE_UPDATE:
					miniMap.draw();
					break;
				case FacadeNotification.MAP_CHANGE_LOCAL:
					var p:Point = notification.getBody() as Point;
					miniMap.setCurrentRectangle(p);
					break;
				case FacadeNotification.MAP_ZOOM_IN:
					break;
				case FacadeNotification.MAP_ZOOM_OUT:
					break;
			}
		}
		
		public function get miniMap():MiniMap
		{
			return this.viewComponent as MiniMap;
		}
	}
}