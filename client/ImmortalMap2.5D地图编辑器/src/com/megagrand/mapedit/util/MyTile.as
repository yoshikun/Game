package com.megagrand.mapedit.util
{
	import flash.geom.Rectangle;
	
	import ghostcat.display.game.Tile45;
	import ghostcat.display.game.Tile45TopLeft;
	
	/**
	 * 以左上角对齐45度 
	 * @author leo
	 * 
	 */	
	public class MyTile extends Tile45
	{
		public function MyTile(width :int,height :int,tileWidth:Number,tileHeight:Number)
		{
			super();
			this.curRect = new Rectangle(0,0,width * tileWidth,height * tileHeight);
			this.contentRect = new Rectangle(-tileWidth/2,0,tileWidth,tileHeight);
		}
		
		public override function render():void
		{
			
		}
	}
}