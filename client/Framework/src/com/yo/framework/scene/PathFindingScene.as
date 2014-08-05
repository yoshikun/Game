package com.yo.framework.scene
{
	import com.yo.framework.ai.graph.SparseGraph;
	import com.yo.framework.ai.pathfinder.AStar;
	import com.yo.framework.ai.pathfinder.RectGrid;
	import com.yo.framework.geom.Polygon;
	import com.yo.framework.scene.movemode.KeyboardMoveMode;
	import com.yo.framework.scene.movemode.MouseMoveMode;
	
	import flash.display.Bitmap;
	import flash.geom.Rectangle;
	
	public class PathFindingScene extends CameraGameScene
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
		
		public function PathFindingScene()
		{
			super();
		}
		
	}
}