package view
{
	import utils.IsoObject;
	
	public class IsoTile extends IsoObject
	{
		protected var _height:Number;
		protected var _color:uint;
		protected var _fillColor:uint;
		
		public function IsoTile(size:Number,color:uint,fillColor:uint=0x000000,height:Number=0)
		{
			super(size);
			_height=height;
			_color=color;
			_fillColor=fillColor;
			draw();
		}
		public function draw():void{
			graphics.clear();
			if(_fillColor!=0x000000)
				graphics.beginFill(_fillColor,0.5);
			else
				graphics.beginFill(0,0.01);
			graphics.lineStyle(0,_color);
			graphics.moveTo(-size,0);
			graphics.lineTo(0,-size*0.5);
			graphics.lineTo(size,0);
			graphics.lineTo(0,size*0.5);
			graphics.lineTo(-size,0);
			graphics.endFill();
		}
		override public function get height():Number{
			return _height;
		}
		override public function set height(value:Number):void{
			_height=value;
			draw();
		}
		public function set color(value:uint):void{
			_color=value;
			draw();
		}
		public function get color():uint{
			return _color;
		}
		public function set size(value:Number):void{
			_size=value;
			draw();
		}
	}
}