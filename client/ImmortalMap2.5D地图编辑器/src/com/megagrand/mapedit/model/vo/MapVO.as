package com.megagrand.mapedit.model.vo
{
	/**
	 * 保存地图所有信息 
	 * @author Lyt
	 * 
	 */	
	public class MapVO
	{
		/**
		 *地图名字 
		 */		
		public var mapName :String;
		/**
		 * 地图宽度 
		 */		
		public var width:int;
		
		/**
		 * 地图高度 
		 */		
		public var height:int;
		
		/**
		 * 每格Tile宽度 
		 */		
		public var tileWidth:Number;
		
		/**
		 * 每格Tile高度 
		 */		
		public var tileHeight:Number;
		
		/**
		 * SWF资源路径 
		 */
		public var swfPath:String;
		/**
		 * 背景图资源路径 
		 */		
		public var imgPath :String;
		/**
		 * 背景图偏移X坐标
		 */		
		public var px :int;
		/**
		 * 背景图偏移Y坐标
		 */		
		public var py :int;
		/**
		 * 二维数组[y][x]格式，保存所有地形 
		 */		
		public var tilesTypeAry:Array;
		
		/**
		 * 二维数组[y][x]格式，保存地图坐标是否可通行，1是不可通行 ， 0 是可通行 
		 */		
		public var paths:Array;
		/**
		 *  二维数组[y][x]格式，保存所有addCHild地形的实例
		 */		
		public var tilesObjAry :Array;
		/**
		 * 二维数组[y][x]格式,保存所有addCHild路径点的实例
		 */		
		public var pathsObjAry :Array;
		/**
		 * 所有特殊选区 
		 */		
		public var areaList:Vector.<AreaVO>;
		
		public var resetSwfPath :String;
		public function MapVO()
		{
		}
	}
}