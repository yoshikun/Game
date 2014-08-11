package com.heptafish.mapeditor.layers
{
	import com.heptafish.mapeditor.items.Building;
	import com.heptafish.mapeditor.utils.MapEditorUtils;
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	import mx.core.UIComponent;
	
	public class BuildingLayer extends UIComponent
	{
		//所有building数组，数组索引对应building id
		public var buildingArray:Array;	
		//建筑数量
		private var _buildingCount:int = 0;
		//路点层
		private var _roadLayer:RoadPointLayer;
		
		private var _cellWidth:int;
		
		private var _cellHeight:int;
		
		//获取建筑物清单
		public function BuildingLayer(roadLayer:RoadPointLayer)
		{
			_roadLayer = roadLayer;
			buildingArray = new Array();
		}
		//放置建筑物
		public function placeAndClone(building:Building, tilePoint:Point):void
		{
			placeSign(building, tilePoint);
			placeBuilding(building, tilePoint);
		}
		
		//放置建筑物图片
		public function placeBuilding(building:Building, tilePoint:Point):void
		{
			this.buildingArray[_buildingCount] = building;
			
			this.addChild(building);
			
			_buildingCount++;
		}
		
		//放置障碍物障碍点
		private function placeSign(building:Building, tilePoint:Point):void
		{
			//阻挡和阴影标记
			var pt:Point = MapEditorUtils.getPixelPoint(_cellWidth, _cellHeight, tilePoint.x, tilePoint.y);
			//把XML里的障碍点信息转化为数组
			var hinderArr:Array = building.info.hinder.split(",");
			//没有阻挡设置
			if (hinderArr && hinderArr.length >= 3)
			{
			     // building的元点在地图坐标系中的tile坐标
				var len:int = hinderArr.length;
				for (var i:int = 0; i < len; i += 2) 
				{
					var pxt:int = pt.x - int(hinderArr[i]) - _cellWidth/2;
					var pyt:int = pt.y - int(hinderArr[i + 1]) - _cellHeight/2;
					_roadLayer.drawWalkableBuilding(building.info.hinder, pxt, pyt, false, _cellWidth, _cellHeight);
				}
			}
		}
		
		//移除建筑
		public function removeBuild(building:Building):void
		{
			//获取当前建筑物网格的行列坐标
			var offsetCt:Point = MapEditorUtils.getCellPoint(_cellWidth, _cellHeight, building.info.originX, building.info.originY);
			//获取当前建筑物网格的象素坐标
			var offsetPt:Point = MapEditorUtils.getPixelPoint(_cellWidth, _cellHeight, offsetCt.x, offsetCt.y);
			//获得建筑物障碍点信息的字符串
			var walkableStr:String = building.info.hinder;
			//把XML里的障碍点信息转化为数组
			var wa:Array = walkableStr.split(",");
			//获取建筑物的原点
			var originPX:int = building.x - offsetPt.x;
			var originPY:int = building.y - offsetPt.y;
			//移除建筑的障碍点
			_roadLayer.drawWalkableBuilding(building.info.hinder, originPX, originPY, true, _cellWidth, _cellHeight);
			//移除建筑物
			delete buildingArray[buildingArray.indexOf(buildingArray)];
			removeChild(building);
		}
		
		//读取XML配置 放置建筑
		public function drawBuilding(model:MapModel, reset:Boolean = false):void
		{
			_cellWidth = model.cellWidth;
			_cellHeight = model.cellHeight;
			
			for each(var info:BuildingInfo in model.items){
				var building:Building = new Building();
				var cellPoint:Point = new Point(info.tx, info.ty);
				building.info = info;
				building.x = info.px;
				building.y = info.py;
				
				placeAndClone(building, cellPoint);
			}
		}
		
		public function update():void
		{
			
		}
	}
}