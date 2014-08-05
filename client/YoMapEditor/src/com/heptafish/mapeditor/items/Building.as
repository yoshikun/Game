package com.heptafish.mapeditor.items
{
	import com.heptafish.mapeditor.utils.ImageLoader;
	import com.heptafish.mapeditor.utils.MapEditorConstant;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.filesystem.File;
	
	public class Building extends BaseDisplayObject
	{
		public var bitmap:Bitmap;
		
		public var init:Boolean = false;
		
		private var _imageLoader:ImageLoader;
		
		private var _info:BuildingInfo;
		
		public function Building()
		{
			initView();
		}
		
		private function initView():void
		{
			bitmap = new Bitmap();
			addChild(bitmap);
			
			_imageLoader = new ImageLoader();
			_imageLoader.addEventListener(Event.COMPLETE, __imageLoaded);
		}
		
		public function setBitMap(bitMapData:BitmapData):void{
			bitmap.bitmapData = bitMapData;
		}
		
		public function __imageLoaded(evet:Event):void{
			bitmap.bitmapData = _imageLoader.data
		}
		
		public function loadImage():void{
			_imageLoader.load(MapEditorConstant.LIB_HOME.resolvePath(_info.id).nativePath);
		}

		public function get info():BuildingInfo
		{
			return _info;
		}

		public function set info(value:BuildingInfo):void
		{
			_info = value;
		}
	}
}