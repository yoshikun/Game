package com.heptafish.mapeditor.layers
{
	import com.heptafish.mapeditor.utils.MapEditorConstant;
	import com.heptafish.mapeditor.utils.MapEditorUtils;
	
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.geom.Point;
	
	import mx.core.UIComponent;
	
	public class GridLayer extends UIComponent
	{
		private var _mapWidth:Number;		//地图像素宽度
		private var _mapHeight:Number;		//地图像素高度
		
		private var _cellWidth:int;	//一个网格的象素宽
		private var _cellHeight:int;	//一个网格的象素高

		private var _row:int;
		private var _col:int;
		
		private var _gridLineColor:uint = 0xbbbbbb;//线条颜色
		
		private var _wHalfTile:int;	//网格象素宽的一半
		private var _hHalfTile:int;	//网格象素高的一半
		
		private var _layer:Shape;
		
		public function GridLayer()
		{
			initView();
		}
		
		private function initView():void
		{
			_layer = new Shape();
			this.addChild(_layer);
		}
		
		//画制网格
		public function drawGrid(mapWidth:Number, mapHeight:Number, cellWidth:int, cellHeight:int):void
		{
			_mapWidth = mapWidth;
			_mapHeight = mapHeight;
			_cellWidth = cellWidth;
			_cellHeight = cellHeight;
			
			_col = (_mapWidth / _cellWidth);
			_row = (_mapHeight / _cellHeight);
			
			_wHalfTile = int(_cellWidth/2);
			_hHalfTile = int(_cellHeight/2); 
			
			_layer.graphics.clear();
			_layer.graphics.lineStyle(1, _gridLineColor, 1);
			
			var dblMapWidth:int = col * 2 + 1;
			var dblMapHeight:int = row * 2 + 1;
			for (var i:int = 1; i < dblMapWidth; i = i + 2)
			{
				_layer.graphics.moveTo(i * _wHalfTile, 0);
				if (dblMapHeight + i >= dblMapWidth)
				{
					_layer.graphics.lineTo(dblMapWidth * _wHalfTile, (dblMapWidth-i) * _hHalfTile);
				}
				else
				{
					_layer.graphics.lineTo((dblMapHeight+i) * _wHalfTile, dblMapHeight * _hHalfTile);
				}
				
				_layer.graphics.moveTo(i * _wHalfTile, 0);
				if (i <= dblMapHeight)
				{
					_layer.graphics.lineTo(0, i * _hHalfTile);
				}
				else
				{
					_layer.graphics.lineTo((i - dblMapHeight) * _wHalfTile, dblMapHeight * _hHalfTile);//i-row-1
				}
			}
			
			for (var j:int = 1; j < dblMapHeight; j = j + 2)
			{
				
				_layer.graphics.moveTo(0, j * _hHalfTile);
				if (dblMapHeight-j >= dblMapWidth)
				{
					_layer.graphics.lineTo(dblMapWidth * _wHalfTile, (dblMapWidth+j) * _hHalfTile);
				}
				else
				{
					_layer.graphics.lineTo((dblMapHeight-j) * _wHalfTile, dblMapHeight * _hHalfTile);
				}
			}
			
			for (var m:int=0; m<dblMapHeight; m=m+2)
			{
				_layer.graphics.moveTo(dblMapWidth * _wHalfTile, m * _hHalfTile);
				if (dblMapWidth-dblMapHeight+m < 0)
				{
					_layer.graphics.lineTo(0, (dblMapWidth+m) * _hHalfTile);
				}
				else
				{
					_layer.graphics.lineTo((dblMapWidth-dblMapHeight+m) * _wHalfTile, dblMapHeight * _hHalfTile);
				}
			}
			//重设宽高，滚动条用
			//this.width = col * _tilePixelWidth;;
			//trace("this.width"+this.width)
			//this.height = (row + 1) * _tilePixelHeight / 2;
			//trace("this.height"+this.height);	
		}

		public function get cellWidth():int
		{
			return _cellWidth;
		}

		public function set cellWidth(value:int):void
		{
			_cellWidth = value;
		}

		public function get cellHeight():int
		{
			return _cellHeight;
		}

		public function set cellHeight(value:int):void
		{
			_cellHeight = value;
		}

		public function get row():int
		{
			return _row;
		}

		public function set row(value:int):void
		{
			_row = value;
		}

		public function get col():int
		{
			return _col;
		}

		public function set col(value:int):void
		{
			_col = value;
		}


	}
}