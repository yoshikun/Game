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
		private var maxNum:int = 0;
		//路点层
		private var _roadLayer:RoadPointLayer;
		//获取建筑物清单
		public function BuildingLayer(roadLayer:RoadPointLayer)
		{
			_roadLayer    = roadLayer;
			buildingArray = new Array();
		}
		//放置建筑物
		public function placeAndClone(bld:Building, tilePoint:Point):Building{
			placeSign(bld, tilePoint);
			placeBuilding(bld, tilePoint);
			return bld;
		}
		
		//放置建筑物图片
		public function placeBuilding(building:Building, tilePoint:Point):Building
		{
//			var info:BuildingInfo = new BuildingInfo();
			building.x = building.x;
			building.y = building.y;

//			building.info.id = maxNum;
			building.info.px = building.x;
			building.info.py = building.y;
			building.info.ix = tilePoint.x;
			building.info.iy = tilePoint.y;

			this.buildingArray[maxNum] = building;
			this.addChild(building);
			
			this.maxNum++;
			return building;
		}
		
		//放置障碍物障碍点
		private function placeSign(bld:Building, tilePoint:Point):void
		{
			//获取单元格的宽，高
			var tilePixelWidth:int = this.parentApplication._cellWidth;
			var tilePixelHeight:int = this.parentApplication._cellHeight;
			
			//阻挡和阴影标记
			var pt:Point = MapEditorUtils.getPixelPoint(tilePixelWidth, tilePixelHeight, tilePoint.x, tilePoint.y);
			//获得建筑物障碍点信息的字符串
			var walkableStr:String = bld.info.walkable;
			//把XML里的障碍点信息转化为数组
			var wa:Array = walkableStr.split(",");
			//没有阻挡设置
			if (walkableStr != null && walkableStr.length >= 3)
			{
			     // building的元点在地图坐标系中的tile坐标
				var pxt:int = pt.x - int(wa[0]) - tilePixelWidth/2;
				var pyt:int = pt.y - int(wa[1]) - tilePixelHeight/2;
				_roadLayer.drawWalkableBuilding(bld, pxt, pyt, false);
			}
			
		}
		
		//移除建筑
		public function removeBuild(bld:Building):void
		{
			//获取单元格的宽，高
			var tilePixelWidth:int  = this.parentApplication._cellWidth;
			var tilePixelHeight:int = this.parentApplication._cellHeight;
			//获取当前建筑物网格的行列坐标
			var offsetCt:Point = MapEditorUtils.getCellPoint(tilePixelWidth, tilePixelHeight, bld.info.xoffset, bld.info.yoffset);
			//获取当前建筑物网格的象素坐标
			var offsetPt:Point = MapEditorUtils.getPixelPoint(tilePixelWidth, tilePixelHeight, offsetCt.x, offsetCt.y);
			//获得建筑物障碍点信息的字符串
			var walkableStr:String = bld.info.walkable;
			//把XML里的障碍点信息转化为数组
			var wa:Array = walkableStr.split(",");
			//获取建筑物的原点
			var originPX:int = bld.x - offsetPt.x;
			var originPY:int = bld.y - offsetPt.y;
			//移除建筑的障碍点
			_roadLayer.drawWalkableBuilding(bld, originPX, originPY, true);
			//移除建筑物
			delete buildingArray[buildingArray.indexOf(buildingArray)];
			removeChild(bld);
		}
		
		//读取XML配置 放置建筑
		public function drawBuilding(model:MapModel, reset:Boolean = false):void
		{
			for each(var info:BuildingInfo in model.items){
				var building:Building = new Building();
				var cellPoint:Point = new Point(info.ix, info.iy);
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