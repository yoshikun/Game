package com.heptafish.mapeditor.items
{
	import com.heptafish.mapeditor.layers.RoadPointLayer;
	import com.heptafish.mapeditor.utils.ImageLoader;
	import com.heptafish.mapeditor.utils.MapEditorConstant;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.filesystem.File;
	
	public class Building extends BaseDisplayObject
	{
		private var _bitmap:Bitmap;
		
		private var _imageLoader:ImageLoader;
		
		private var _info:BuildingInfo;
		
		private var _roadPointLayer:RoadPointLayer; //路点层
		
		public function Building()
		{
			initView();
		}
		
		private function initView():void
		{
			_bitmap = new Bitmap();
			this.addChild(_bitmap);
			
			_roadPointLayer = new RoadPointLayer();
			this.addChild(_roadPointLayer);
			
			_imageLoader = new ImageLoader();
			_imageLoader.addEventListener(Event.COMPLETE, __imageLoaded);
		}
		
		public function update():void
		{
			if(_info){
				_bitmap.bitmapData = _info.bitmapData;
				_roadPointLayer.drawWalkableBuilding(_info.hinder, _info.originX, _info.originY, true, _info.cellWidth, _info.cellHeight);
			}
			else
			{
				
			}
		}
		
		public function __imageLoaded(evet:Event):void{
			_bitmap.bitmapData = _imageLoader.data
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
			update();
		}
	}
}