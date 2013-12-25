package com.megagrand.mapedit.view.ui
{
	import flash.display.BlendMode;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import ghostcat.display.game.Display45Util;

	/**
	 * 网格层
	 * @author leo
	 * 
	 */	
	public class GridLayer extends Sprite
	{
		private var scale :Number = 1;
		public function GridLayer(mapRows:int, mapCols:int, tileWidth:Number, tileHeight:Number)
		{
			super();
			
			this.graphics.lineStyle(1,0xff0000,0.3);
			var mapWidth :int = mapRows * tileWidth;
			var mapHeight :int = mapCols * tileHeight;
			this.graphics.beginFill(0);
			Display45Util.setContentSize(tileWidth,tileHeight);
			// Y方向
			for(var x:int = 0 ; x <= mapRows ; x++)
			{
				var dx:Number = x * tileWidth;
				var p1:Point = new Point(dx,0);
				p1 = Display45Util.trans90To45(p1);
				var p2:Point = new Point(dx,mapHeight);
				p2 = Display45Util.trans90To45(p2);
				this.graphics.moveTo(p1.x,p1.y);
				this.graphics.lineTo(p2.x,p2.y);
			}
			
			// X 方向
			for(var y:int = 0 ; y <= mapCols ; y++)
			{
				var dy:Number = y * tileHeight;
				var p3:Point = Display45Util.trans90To45(new Point(0,dy));
				var p4:Point = Display45Util.trans90To45(new Point(mapWidth,dy));
				this.graphics.moveTo(p3.x,p3.y);
				this.graphics.lineTo(p4.x,p4.y);
			}
			this.graphics.endFill();
			
			// 输出坐标
			for(var y1:int = 0 ; y1 < mapCols ;y1++)
			{
				for(var x1:int = 0 ; x1 < mapRows ; x1++)
				{
					var dx1:Number = x1 * tileWidth;
					var dy1:Number = y1 * tileHeight;
					var p5:Point = Display45Util.trans90To45(new Point(dx1,dy1));
					var txt:TextField = new TextField();
					txt.blendMode = BlendMode.LAYER;
					txt.cacheAsBitmap = true;
					txt.selectable = txt.border = false;
					txt.defaultTextFormat = new TextFormat(null,18,0,false,false,false,null,null,"center");
					txt.text = x1 + "," + y1;
					txt.width = 100;
					txt.height = 25;
					txt.x = p5.x - 50;
					txt.y = p5.y + 5;
					this.addChild(txt);
				}
			}
		}
	}
}