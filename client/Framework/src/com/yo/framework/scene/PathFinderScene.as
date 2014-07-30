package com.yo.framework.scene
{
	import flash.display.Bitmap;
	import flash.geom.Rectangle;
	
	public class PathFinderScene extends CameraGameScene
	{
		/**
		 * 移动方式 
		 */        
		protected var _keyboardMovement:KeyboardMoveMode;
		
		protected var _mouseMoveMode:MouseMoveMode;
		
		/**
		 * 图数据 
		 */		
		protected var _naviGraph:SparseGraph;
		
		protected var _obstacles:Vector.<Polygon>;
		
		/**
		 * 寻路算法 
		 */		
		protected var _astar:AStar;
		
		protected var _floor:Bitmap = new Bitmap();
		
		/**
		 * 矩形寻路 
		 */		
		protected var _rectGrid:RectGrid;
		
		protected var _row:int;
		
		protected var _column:int;
		
		protected var _totalBound:Rectangle;
		
		public function PathFinderScene()
		{
			super();
		}
		
	}
}