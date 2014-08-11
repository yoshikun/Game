package com.heptafish.mapeditor.layers
{
	import com.heptafish.mapeditor.items.Building;
	import com.heptafish.mapeditor.utils.HashMap;
	import com.heptafish.mapeditor.utils.MapEditorConstant;
	import com.heptafish.mapeditor.utils.MapEditorUtils;
	
	import flash.display.Shape;
	import flash.geom.Point;
	
	import mx.core.UIComponent;
	//路点层
	public class RoadPointLayer extends UIComponent
	{
		//绘制圆形路点标记常量标识
		public static var MARK_CIRCLE:int  = 0;
		//绘制菱形路点标记常量标识
		public static var MARK_DIAMOND:int = 1;
		//绘制带十字线菱形路点标记常量标识
		public static var MARK_LINE_DIAMOND:int = 2;
		//默认颜色
		public var DEFAULT_COLOR:uint = 0xCCCCCC;
		//路点颜色
		public var ROAD_COLOR:uint = 0x33FF33;
		//障碍点颜色
		public var HINDER_COLOR:uint = 0xFF0033;
		//建筑路点颜色
		public var ROAD_BUILDING_COLOR:uint = 0x0066CC;
		//建筑点
		public var CELL_TYPE_BUILDING:uint = 0xFF0000;
		//颜色
		private var _colorArr:Array = [DEFAULT_COLOR, ROAD_COLOR, HINDER_COLOR, ROAD_BUILDING_COLOR, CELL_TYPE_BUILDING];
		//设置单元格宽
		private var _tilePixelWidth:Number;
		//设置单元格高
		private var _tilePixelHeight:Number;
		//一个HashMap 对象，存储所有标记过的路点 
		private var _childMap:HashMap;
		//HashMap 对象，存储所有属于建筑物的路点
		private var _buildingPointMap:HashMap;
		//网格层
		private var _gridLayer:GridLayer;
		//用来区分当前路点层使用的图形标记是圆形还是菱形
		private var _cellMark:int = RoadPointLayer.MARK_DIAMOND;
		//绘制路点图形标记的代理函数
		private var _cellCreater:Function;
		
		private var _mapArr:Array;
		
		public function RoadPointLayer()
		{
			_childMap  = new HashMap();
			_buildingPointMap = new HashMap();
			//判断当前路点层使用的图形标记是圆形还是菱形
			setCellCreater(_cellMark);
		}
		
		//根据类型画出单元格
		public function drawCell(xIndex:int,yIndex:int, cellType:int):void{
			var p:Point = MapEditorUtils.getPixelPoint(_tilePixelWidth,_tilePixelHeight,xIndex,yIndex);
			
			var mapKey:String = xIndex + "," + yIndex;
			addRoadPoint(cellType, mapKey, p);
		}
		
		//将指定单元格设置为初始状态
		public function resetCell(xIndex:int,yIndex:int):void{
			var mapKey:String = xIndex + "," + yIndex;
			var oldCell:* = _childMap.getValue(mapKey);
			if(oldCell != null)
			{
				removeChild(oldCell.shape);
				_childMap.remove(mapKey);
			}
		}
		
		/**
		 * originPX, originPY	建筑物元点在地图坐标系中的像素坐标
		 * building				建筑物显示对象
		 * walkable 			是否可行走
		 */
		public function drawWalkableBuilding(hinder:String, originPX:int, originPY:int, wb:Boolean, cellWidth:Number, cellHeight:Number):void
		{
			var hinderArr:Array = hinder.split(",");
			if (hinderArr == null || hinderArr.length < 2)
			{
				return;
			}
			
			var xtmp:int;
			var ytmp:int;
		
			for (var i:int=0; i<hinderArr.length; i+=2)
			{
				xtmp = originPX + int(hinderArr[i]);
				ytmp = originPY + int(hinderArr[i+1]);
				var pt:Point = MapEditorUtils.getCellPoint(cellWidth, cellHeight, xtmp, ytmp);
				var mapKey:String = pt.x + "," + pt.y;
					
				if (wb == false)//增加阻挡
				{
					if(pt.x >= 0 && xtmp > 0)
					{
						//将建筑物中的障碍点记录在 _buildingPointMap 中
						if(!_buildingPointMap.containsKey(mapKey)) 
						{
							_buildingPointMap.put(mapKey, new Point(pt.x, pt.y));
						}
						
						drawCell(pt.x, pt.y, MapEditorConstant.CELL_TYPE_HINDER);
						_mapArr[pt.y][pt.x] = MapEditorConstant.CELL_TYPE_HINDER;
					}
				}
				else//删除阻挡
				{
					if(pt.x >= 0 && xtmp > 0) 
					{
						removeRoadPoint(mapKey, pt);
					}
				}
			}

		}
		
		//打开时先画出原来的路点，并标记录有障碍的路点
		public function drawArr(arr:Array, roadType:int):void{
			drawRoadPoint(arr, roadType);
		}
		
		public function drawRoadPoint(arr:Array, roadType:int):void{
			_mapArr = arr;
			for(var iy:int = 0; iy < arr.length; iy++){
				for(var ix:int = 0; ix < arr[0].length; ix++){
					var cell:int = arr[iy][ix];
					var mapKey:String = ix + "," + iy;
					if(roadType == MapEditorConstant.TYPE_SAVE_MAP_HINDER){
						if(cell == 1){
							drawCell(ix, iy, MapEditorConstant.CELL_TYPE_ROAD);
						}
						else if(cell == 2)
						{
							if(!_buildingPointMap.containsKey(mapKey))
							{
								drawCell(ix, iy, MapEditorConstant.CELL_TYPE_HINDER);
							}
						}
					}else if(roadType == MapEditorConstant.TYPE_SAVE_MAP_ROAD){
						if(cell == 1){
							drawCell(ix, iy, MapEditorConstant.CELL_TYPE_ROAD);
						}
						else if(cell == 2)
						{
							if(!_buildingPointMap.containsKey(mapKey))
							{
								drawCell(ix, iy, MapEditorConstant.CELL_TYPE_HINDER);
							}
						}
					}
				}
			}
		}
		
		protected function addRoadPoint(flag:int, mapKey:String, pt:Point):void{
			var obj:Object;
			var cell:Shape;
			if(_childMap.containsKey(mapKey)){
				obj = _childMap.getValue(mapKey);
				if(obj.type != flag){
					if(obj.shape.parent == this)
					{
						removeChild(obj.shape);
					}
					
					cell = _cellCreater(flag, pt);
					addChild(cell);
					
					_childMap.remove(mapKey);
					var newObj:Object = {shape:cell, count:1, type:flag};
					_childMap.put(mapKey, newObj);
				}else if(obj.type == flag){
					if(flag == 2){
						obj.count += 1;
						_childMap.put(mapKey, obj);
					}else if(flag == 1){
						if(obj.shape.parent == this)
						{
							removeChild(obj.shape);
						}
						addChild(obj.shape);
					}
				}
				
			}else{
				cell = _cellCreater(flag, pt);
				addChild(cell);
				obj = {shape:cell, count:1, type:flag};
				_childMap.put(mapKey, obj);
			}
		}
		
		//移除路点
		protected function removeRoadPoint(mapKey:String, pt:Point):void{
			var obj:Object = new Object();
			if(_childMap.containsKey(mapKey)){
				obj = _childMap.getValue(mapKey);
				if(obj.type == 1){
					removeChild(obj.shape);
					_childMap.remove(mapKey);
					_mapArr[pt.y][pt.x] = MapEditorConstant.CELL_TYPE_SPACE;
					
				}else if(obj.type == 2){
					obj.count--;
					if(obj.count == 0){
						removeChild(obj.shape);
						_childMap.remove(mapKey);
						if(_buildingPointMap.containsKey(mapKey)) _buildingPointMap.remove(mapKey);
						_mapArr[pt.y][pt.x] = MapEditorConstant.CELL_TYPE_SPACE;
						
					}else{
						_childMap.put(mapKey, obj);
					}
				}
			}
		}
		
		//绘制圆形的路点标记
		protected function drawCircleShape(type:int, pt:Point):Shape{
			var cell:Shape = new Shape();
			cell.graphics.beginFill(_colorArr[type], 0.5);
			cell.graphics.drawCircle(0, 0, _tilePixelHeight/4);
			cell.graphics.endFill();
			cell.x = pt.x;
			cell.y = pt.y;
			return cell;
		}
		
		//绘制菱形的路点标记
		protected function drawDiamondShape(type:int, pt:Point):Shape{
			var cell:Shape = new Shape();
			cell.graphics.beginFill(_colorArr[type], 0.3);
			cell.graphics.moveTo(0, _tilePixelHeight/2);
			cell.graphics.lineTo(_tilePixelWidth/2, 0);
			cell.graphics.lineTo(_tilePixelWidth, _tilePixelHeight/2);
			cell.graphics.lineTo(_tilePixelWidth/2, _tilePixelHeight);
			cell.graphics.lineTo(0, _tilePixelHeight/2);
			cell.graphics.endFill();
			cell.x = pt.x - _tilePixelWidth/2;
			cell.y = pt.y - _tilePixelHeight/2;
			return cell;
		}
		
		//得到建筑编辑器中的障碍
		public function drawLineDiamondShape(type:int, pt:Point):Shape{
			var cell:Shape = new Shape();
			//外框
			cell.graphics.lineStyle(1, 0xff0000, 0.6);
			cell.graphics.moveTo(0, _tilePixelHeight/2);
			cell.graphics.lineTo(_tilePixelWidth/2, 0);
			cell.graphics.lineTo(_tilePixelWidth, _tilePixelHeight/2);
			cell.graphics.lineTo(_tilePixelWidth/2, _tilePixelHeight);
			cell.graphics.lineTo(0, _tilePixelHeight/2);
			//里框
			var hoff:Number = _tilePixelHeight/4;
			var woff:Number = hoff * _tilePixelWidth / _tilePixelHeight;
			cell.graphics.moveTo(woff, _tilePixelHeight/2);
			cell.graphics.lineTo(_tilePixelWidth/2, hoff);
			cell.graphics.lineTo(_tilePixelWidth-woff, _tilePixelHeight/2);
			cell.graphics.lineTo(_tilePixelWidth/2, _tilePixelHeight-hoff);
			cell.graphics.lineTo(woff, _tilePixelHeight/2);
			//交叉线
			cell.graphics.moveTo(0, _tilePixelHeight/2);
			cell.graphics.lineTo(_tilePixelWidth, _tilePixelHeight/2);
			cell.graphics.moveTo(_tilePixelWidth/2, 0);
			cell.graphics.lineTo(_tilePixelWidth/2, _tilePixelHeight);
			
			cell.x = pt.x - _tilePixelWidth/2;
			cell.y = pt.y - _tilePixelHeight/2;
			
			return cell;
		}
		
		protected function setCellCreater(cellMark:int):void{
			switch(cellMark){
				//圆形路点图形标记模式
				case RoadPointLayer.MARK_CIRCLE:
					_cellCreater = drawCircleShape;
					break;
				//菱形路点图形标记模式
				case RoadPointLayer.MARK_DIAMOND:
					_cellCreater = drawDiamondShape;
					break;
				//十字线菱形路点图形标记模式
				case RoadPointLayer.MARK_LINE_DIAMOND:
					_cellCreater = drawLineDiamondShape;
					break;
			}
		}

		public function set cellWidth(cellWidth:Number):void{
			_tilePixelWidth = cellWidth;
		}
		
		public function get cellMark():int {
			return _cellMark;
		}
		public function set cellMark(val:int):void{
			_cellMark = val;
			setCellCreater(_cellMark);
		}
		
		public function get cellWidth():Number{
			return _tilePixelWidth;
		}

		public function set cellHeight(cellHeight:Number):void{
			_tilePixelHeight = cellHeight;
		}
		
		public function get cellHeight():Number{
			return _tilePixelHeight;
		}
		
		public function clear():void
		{
			this.removeChildren();
			_childMap.clear();
			_buildingPointMap.clear();
		}
	}
}