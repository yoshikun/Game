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
		public function placeBuilding(bld:Building, tilePoint:Point):Building
		{
			//获取建筑物的XML信息
			var blXml:XML = bld.configXml.copy();
			var nbld:Building = new Building(this.maxNum);
			nbld.x = bld.x;
			nbld.y = bld.y;
			if(bld._bitMap != null){
				var blBitMap:BitmapData = bld._bitMap.bitmapData.clone();
				nbld.reset(blBitMap,blXml);
			}
			else{
				nbld.configXml = blXml;
				nbld.loadImage();
			}
			nbld.configXml.@id = maxNum;
			nbld.configXml.@px = nbld.x;
			nbld.configXml.@py = nbld.y;
			nbld.configXml.@ix = tilePoint.x;
			nbld.configXml.@iy = tilePoint.y;

			this.buildingArray[maxNum] = nbld;
			nbld = Building(this.addChild(nbld));
			this.maxNum++;
			return nbld;
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
			var walkableStr:String = bld.configXml.walkable;
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
		public function removeBuild(bld:Building):void{
			//获取单元格的宽，高
			var tilePixelWidth:int  = this.parentApplication._cellWidth;
			var tilePixelHeight:int = this.parentApplication._cellHeight;
			//获取当前建筑物网格的行列坐标
			var offsetCt:Point = MapEditorUtils.getCellPoint(tilePixelWidth, tilePixelHeight, bld.configXml.@xoffset, bld.configXml.@yoffset);
			//获取当前建筑物网格的象素坐标
			var offsetPt:Point = MapEditorUtils.getPixelPoint(tilePixelWidth, tilePixelHeight, offsetCt.x, offsetCt.y);
			//获得建筑物障碍点信息的字符串
			var walkableStr:String = bld.configXml.walkable;
			//把XML里的障碍点信息转化为数组
			var wa:Array = walkableStr.split(",");
			//获取建筑物的原点
			var originPX:int = bld.x - offsetPt.x;
			var originPY:int = bld.y - offsetPt.y;
			//移除建筑的障碍点
			_roadLayer.drawWalkableBuilding(bld, originPX, originPY, true);
			//移除建筑物
			delete buildingArray[bld.id];
			removeChild(bld);
		}
		
		//读取XML配置 放置建筑
		public function drawByXml(mapXml:XML, reset:Boolean = false):void{
			for each(var item:XML in mapXml.items.item){
				var bl:Building     = new Building();
				var cellPoint:Point = new Point(item.@ix,item.@iy);
				bl.configXml        = item;
				bl.x                = item.@px;
				bl.y                = item.@py;
				
				placeAndClone(bl, cellPoint);
				
			}
		}

	}
}