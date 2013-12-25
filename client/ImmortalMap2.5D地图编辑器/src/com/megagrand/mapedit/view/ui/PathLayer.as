package com.megagrand.mapedit.view.ui
{
	import flash.display.Sprite;
	import flash.geom.Point;
	
	import ghostcat.display.game.Display45Util;

	/**
	 * 路径层 
	 * @author leo
	 * 
	 */	
	public class PathLayer extends Sprite
	{
		public function PathLayer(mapRows:int, mapCols:int, tileWidth:Number, tileHeight:Number)
		{
			super();
			
			this.graphics.lineStyle(1,0,0.6);
			this.graphics.beginFill(0xff0000,0.7);
			var mapWidth :int = mapRows * tileWidth;
			var mapHeight :int = mapCols * tileHeight;
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
		}
	}
}