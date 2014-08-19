package com.heptafish.mapeditor.layers
{
	
	import com.heptafish.mapeditor.utils.ImageLoader;
	
	import flash.display.Bitmap;
	import flash.events.Event;
	
	import mx.core.UIComponent;

	public class MapLayer extends UIComponent
	{
		//图片读取器
		private var _imageLoader:ImageLoader;
		
		private var _image:Bitmap;
		
		private var _model:MapModel;
		
		public function MapLayer()
		{
			
		}
		
		//读取地图图片
		public function load(path:String):void{
			if(path)
			{
				if(!_imageLoader){
					_imageLoader = new ImageLoader();
				}
				_imageLoader.addEventListener(Event.COMPLETE, __loadSuccess);
				_imageLoader.load(path);
			}
		}
		
		//读取成功
		public function __loadSuccess(evet:Event):void{
			_imageLoader.removeEventListener(Event.COMPLETE, __loadSuccess);
			if(!_image){
				_image = new Bitmap();
				this.addChild(_image);
			}
			_image.bitmapData = _imageLoader.data;
			this.width = _image.width;
			this.height = _image.height;
			
			_model.bitmapData = _imageLoader.data;
		}

		public function get model():MapModel
		{
			return _model;
		}

		public function set model(value:MapModel):void
		{
			_model = value;
		}

	}
}