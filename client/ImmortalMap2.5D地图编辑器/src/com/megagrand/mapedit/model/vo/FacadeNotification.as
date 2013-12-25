package com.megagrand.mapedit.model.vo
{

	/**
	 * 保存游戏中所有用到的Notification 
	 * @author Lyt
	 * 
	 */	
	public class FacadeNotification
	{
		/** 程序启动*/		
		public static const APP_START_UP:String = "APP_START_UP"; 
		
		/**打开地图文件*/		
		public static const UI_CONTROL_FILE_OPEN:String = "UI_CONTROL_FILE_OPEN";
		
		/**还原地图文件*/
		public static const UI_CONTROL_RESTORE_MAP :String = "UI_CONTROL_RESTORE_MAP";
		
		/**保存文件*/		
		public static const UI_CONTROL_FILE_SAVE:String = "UI_CONTROL_FILE_SAVE";
		
		/**设置地图信息*/
		public static const UI_CONTROL_SETTING_MAP_DATA :String = "UI_CONTROL_SETTING_MAP_DATA";
		
		/**创建地图*/		
		public static const UI_CONTROL_FILE_CREATE:String = "UI_CONTROL_FILE_CREATE";
		
		/**使用移动建筑或人物*/		
		public static const UI_CONTROL_MOUSE_MOVE:String = "UI_CONTROL_MOUSE_MOVE";
		
		/**删除建筑或人物*/		
		public static const UI_CONTROL_DELETE :String = "UI_CONTROL_DELETE";
		
		/**刷子工具，鼠标按下时可以拖动，松开时可以填充地图*/		
		public static const UI_CONTROL_BRUSH :String = "UI_CONTROL_BRUSH";
		
		/**手套（移动地图编辑区的显示位置）*/
		public static const UI_CONTROL_DROP :String = "UI_CONTROL_DROP";
		
		/**放大（每点一下地图显示比例+10%）*/
		public static const UI_CONTROL_ZOOMOUT :String = "UI_CONTROL_ZOOMOUT";
		
		/**缩小（每点一下地图显示比例－10%）*/
		public static const UI_CONTROL_ZOOMIN :String = "UI_CONTROL_ZOOMIN";
		
		/**比例重置（设置显示比例为100%）*/
		public static const UI_CONTROL_RESET :String = "UI_CONTROL_RESET";
		
		/**路径增加（设置地图的可通行坐标，可拖动操作）*/
		public static const UI_CONTROL_PATH_ADD :String = "UI_CONTROL_PATH_ADD";
		
		/**路径删除（删除地图的可通行坐标，可拖动操作）*/
		public static const UI_CONTROL_PATH_DELETE :String = "UI_CONTROL_PATH_DELETE";
		
		/**清除刷子*/
		public static const UI_CONTROL_CLEAR_BRUSH :String = "UI_CONTROL_CLEAR_BRUSH";
		
		/**重置视图位置*/
		public static const UI_CONTROL_RESET_POSITION :String = "UI_CONTROL_RESET_POSITION";
		
		/**隐藏路径层*/
		public static const UI_CONTROL_HIDE_PATH :String = "UI_CONTROL_HIDE_PATH";
		
		/**增加路径点*/
		public static const UI_CONTROL_PATHPOINT_ADD :String = "UI_CONTROL_PATHPOINT_ADD";
		
		/**输出地图纹理文件*/
		public static const UI_CONTROL_OUTPUT_MAP_TEXTURE :String = "UI_CONTROL_OUTPUT_MAP_TEXTURE";
		
		/**输出可行区域*/
		public static const UI_CONTROL_OUTPUT_WALKABLE_AREA :String = "UI_CONTROL_OUTPUT_WALKABLE_AREA";
		
		/**地图图元库加载完毕*/
		public static const MAP_RESOURCE_COMPLETE :String = "MAP_RESOURCE_COMPLETE";
		
		/**选中图元库中的元件*/
		public static const SELECT_ITEM :String = "SELECT_ITEM";
		
		/**设置地形*/
		public static const SET_TILE :String = "SET_TILE";
		
		/**隐藏网格层*/
		public static const UI_CONTROL_HIDE_GRID :String = "UI_CONTROL_HIDE_GRID";
		
		/**
		 * 地图TILE发生改变,发送改变的坐标和类型（Array(x,y,type));
		 */		
		public static const MAP_TILE_UPDATE:String = "MAP_TILE_UPDATE";
		
		/**
		 * 地图初始化视图 
		 */		
		public static const MAP_INIT_VIEW:String = "MAP_INIT_VIEW";
		
		/**
		 * 改变地图显示位置（包括小地图）
		 */		
		public static const MAP_CHANGE_LOCAL:String = "MAP_CHANGE_LOCAL";
		
		/**
		 * 地图放大 
		 */		
		public static const MAP_ZOOM_IN:String = "MAP_ZOOM_IN";
		
		/**
		 * 地图缩小 
		 */		
		public static const MAP_ZOOM_OUT:String = "MAP_ZOOM_OUT";
		
		public function FacadeNotification()
		{
			new Error("不用实例化!");
		}
	}
}