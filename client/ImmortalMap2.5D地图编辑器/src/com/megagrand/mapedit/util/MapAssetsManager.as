package com.megagrand.mapedit.util
{
	import com.megagrand.mapedit.model.MapProxy;
	import com.megagrand.mapedit.model.vo.FacadeNotification;
	
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	import ghostcat.text.NumberUtil;
	
	import mx.core.UIComponent;
	
	import org.puremvc.as3.patterns.proxy.Proxy;

	/**
	 * 地图资源加载类 
	 * @author leo
	 * 
	 */	
	public class MapAssetsManager extends Proxy
	{
		private static var instance :MapAssetsManager;
		private var swfLoader :Loader;
		public function MapAssetsManager(prv :privateClass)
		{
		}
		
		public static function getInstance():MapAssetsManager
		{
			if(instance == null)
			{
				instance = new MapAssetsManager(new privateClass());
			}
			return instance;
		}
		
		public function sourceLoader(byteData :ByteArray):void
		{
			swfLoader = new Loader();
			//air中loadBytes方法不能加载可执行的内容，所以要加上下面两句
			var loaderContext:LoaderContext = new LoaderContext();
		　　	loaderContext.allowLoadBytesCodeExecution = true; 
			swfLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,swfLoaderHandler);
			swfLoader.loadBytes(byteData,loaderContext);
		}
		
		private function swfLoaderHandler(event :Event):void
		{
			var loaderInfo :LoaderInfo = (event.currentTarget) as LoaderInfo;
			//地图图元库加载完毕
			sendNotification(FacadeNotification.MAP_RESOURCE_COMPLETE,loaderInfo);
		}
		
	}
}

class privateClass{}