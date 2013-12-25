package com.megagrand.mapedit.model
{
	import com.megagrand.mapedit.model.vo.FacadeNotification;
	import com.megagrand.mapedit.model.vo.MapVO;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.utils.Dictionary;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	/**
	 * 地图操作代理
	 */	
	public class MapProxy extends Proxy implements IProxy
	{
		public static const NAME:String = "MapProxy";
		private var _mapResourceDict :Dictionary = new Dictionary();
		
		public function MapProxy()
		{
			super(NAME);
		}
		
		
		/**
		 * 创建地图VO 
		 * @param w 地图宽
		 * @param h 地图高
		 * @param tileW 方块宽
		 * @param tileH 方块高
		 * 
		 */		
		public function createMapVO(w :int,h :int,tileW :Number,tileH :Number):void
		{
			var mapVO :MapVO = new MapVO();
			mapVO.width = w;
			mapVO.height = h;
			mapVO.tileWidth = tileW;
			mapVO.tileHeight = tileH;
			createMap(mapVO);
		}
		
		/**
		 * 创建新地图 
		 * @param vo
		 * 
		 */		
		public function createMap(vo :MapVO):void
		{
			var x:int,y:int;
			vo.tilesTypeAry = [];
			vo.paths = [];
			vo.tilesObjAry = [];
			vo.pathsObjAry = [];
			for(y = 0 ; y < vo.height ; y++)
			{
				vo.tilesTypeAry.push([]);
				vo.paths.push([]);
				vo.tilesObjAry.push([]);
				vo.pathsObjAry.push([]);
				for(x = 0 ; x < vo.width ; x++)
				{
					vo.tilesTypeAry[y][x] = 0;
					vo.paths[y][x] = 0;
					vo.tilesObjAry[y][x] = null;
					vo.pathsObjAry[y][x] = null;
				}
			}
			data = vo;
		}
		
		/**
		 * 打开地图文件 
		 * @param path
		 * 
		 */		
		public function openMap(vo:MapVO):void
		{
			this.data = vo;
			
		}
		
		
		/**
		 * 设置tile 
		 * @param x
		 * @param y
		 * @param tile 0 为空（删除）
		 * 
		 */		
		public function setTile(x:int,y:int,tile:int):void
		{
			if(x < 0 || 
				y < 0 || 
				x >= mapVO.width || 
				y >= mapVO.height ||
				mapVO.tilesTypeAry[y][x] == tile
			) return;
			
			mapVO.tilesTypeAry[y][x] = tile;
			
			sendNotification(FacadeNotification.MAP_TILE_UPDATE,[x,y,tile]);
		}
		
		
		public function get mapVO():MapVO
		{
			return data as MapVO;
		}

		public function get mapResourceDict():Dictionary
		{
			return _mapResourceDict;
		}

		public function set mapResourceDict(value:Dictionary):void
		{
			_mapResourceDict = value;
		}

	}
}