package com.heptafish.mapeditor.utils
{
	import flash.filesystem.File;
	
	public class MapEditorConstant
	{
		public function MapEditorConstant()
		{
		}
		
		//空白低点 最后会根据设置 转换为相应不可移动或者可移动区域
		public static const CELL_TYPE_SPACE:int = 0;
		//路点
		public static const CELL_TYPE_ROAD:int = 1;
		//障碍
		public static const CELL_TYPE_HINDER:int = 2;
		//建筑路
		public static const CELL_TYPE_BUILDING_ROAD:int = 3;
		//建筑
		public static const CELL_TYPE_BUILDING:int = 4;
		
		//保存时将空白区域转换为路点
		public static const TYPE_SAVE_MAP_ROAD:int = 0;
		//保存时将空白区域转换为障碍
		public static const TYPE_SAVE_MAP_HINDER:int = 1;
		
		//地图元件库图片目录
		public static const COMPONENT_LIB_HOME:File  = File.documentsDirectory.resolvePath(MAIN_PATH + IMAGE_PATH);
		//主目录
		public static const LIB_HOME:File = File.documentsDirectory.resolvePath(MAIN_PATH);
		//库图片路径
		public static const IMAGE_PATH:String = "images/";
		//地图图片路径
		public static const MAP_PATH:String = "maps/";
		//主路径
		public static const MAIN_PATH:String = "MapEditor/";
	}
}