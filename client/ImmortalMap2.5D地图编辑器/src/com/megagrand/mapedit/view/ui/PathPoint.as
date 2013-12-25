package com.megagrand.mapedit.view.ui
{
	import flash.display.Sprite;
	/**
	 * 路径节点 
	 * @author leo
	 * 
	 */	
	public class PathPoint extends Sprite
	{
		public var pointWidth :int = 20;
		public var pointHeight :int = 20;
		public var pointRadius :int = 10;
		public function PathPoint()
		{
			super();
			this.graphics.beginFill(0);
			this.graphics.drawCircle(10,10,pointRadius);
			this.graphics.endFill();
		}
	}
}