package com.megagrand.mapedit.view.ui
{
	import com.megagrand.mapedit.model.MapProxy;
	import com.megagrand.mapedit.model.vo.MapVO;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import ghostcat.text.NumberUtil;
	
	import mx.core.UIComponent;

	/**
	 * 迷你小地图 
	 * @author leo
	 * 
	 */	
	public class MiniMap extends UIComponent
	{
		/**
		 * 背景色
		 */		
		public static var BACK_GROUD_COLOR:uint = 0xffaaaaaa;
		
		public var mapVO:MapVO;
		
		public var bitmap:Bitmap;
		
		/**
		 * 绘图的偏移区 
		 */		
		public var bitmapRect:Rectangle;
		
		/**
		 * 所有TILE 
		 */		
		public var allTile:Vector.<BitmapData>;
		
		/**
		 * 缩放后TILE的大小 
		 */		
		public var tileSize:Rectangle;
		
		/**
		 * 缩放比例
		 */		
		public var scale:Number = 1;
		
		/**
		 * 显示区位置和大小 
		 */		
		public var currentRect:Rectangle;
		
		public function MiniMap()
		{
			super();
			
			bitmap = new Bitmap();
			addChild(bitmap);
		}
		
		/**
		 * 
		 * @param mapVO
		 * @param viewWidth 小地图显示区大小
		 * @param viewHeight
		 * 
		 */		
		public function initMiniMap(mapProxy:MapProxy,viewWidth:Number,viewHeight:Number):void
		{
			this.mapVO = mapProxy.mapVO;
			
			if(bitmap.bitmapData)
			{
				bitmap.bitmapData.dispose();
				bitmap.bitmapData = null;
			}
			
			// 设置默认TILE大小
			tileSize = new Rectangle(0,0,mapVO.tileWidth,mapVO.tileHeight);
			
			// 地图绘制成图形后。图形的大小
			var pLB:Point = get45(0,mapVO.height);// 左下角点
			var pR:Point = get45(mapVO.width,0);// 右上角
			var pRB:Point = get45(mapVO.width,mapVO.height);// 右下角
			
			bitmapRect = new Rectangle();
			bitmapRect.width = pR.x - pLB.x;
			bitmapRect.height = pRB.y;
			
			scale = Math.min(viewWidth/bitmapRect.width,viewHeight/bitmapRect.height);
			tileSize.width *= scale;
			tileSize.height *= scale;
			if(tileSize.width < 1) tileSize.width = 1;
			if(tileSize.height < 1) tileSize.height = 1;
			
			
			bitmapRect.width *= scale;
			bitmapRect.height *= scale;
			bitmapRect.x = (-pLB.x - mapVO.tileWidth/2) * scale;
			bitmapRect.y = 0;
			
			bitmap.bitmapData = new BitmapData(bitmapRect.width,bitmapRect.height,true,0);
			
			bitmap.y = (viewHeight - bitmapRect.height)/2.0;
			
			// 删除原来素材的TILE
			if(allTile)
			{
				while(allTile.length > 0)
				{
					allTile.pop().dispose();
				}
			}
			else
			{
				allTile = new Vector.<BitmapData>();
			}
			for (var i:int = 1 ; ; i++)
			{
				/*var tileName:String = "map.Tile" + NumberUtil.fillZeros(i.toString(),2,"0");
				if(!loaderInfo.applicationDomain.hasDefinition(tileName))
				{
					break;
				}
				var cls:Class = loaderInfo.applicationDomain.getDefinition(tileName) as Class;
				*/
				var sp:Sprite = mapProxy.mapResourceDict["Tile" + NumberUtil.fillZeros(i.toString(),2,"0")];
				if(!sp)
				{
					break;
				}
				var m:Matrix = new Matrix();
				m.translate(tileSize.width/(2*scale),0);
				m.scale(scale,scale);
				var bmp:BitmapData = new BitmapData(tileSize.width,tileSize.height,true,0);
				bmp.draw(sp,m);
				allTile.push(bmp);
			}
			
			draw();
		}
		
		/**
		 * 改变显示区 
		 * @param p
		 * 
		 */		
		public function setCurrentRectangle(p:Point):void
		{
			
		}
		
		/**
		 * 缩放重置显示区 
		 * @param v
		 * 
		 */		
		public function zoom(v:Number):void
		{
			draw();
		}
		
		public function draw():void
		{
			bitmap.bitmapData.lock();
			bitmap.bitmapData.fillRect(bitmap.bitmapData.rect,BACK_GROUD_COLOR);
			var p:Point;
			for (var y:int = 0 ; y < mapVO.height ; y++)
			{
				for (var x:int = 0 ; x < mapVO.width ; x++)
				{
					if(mapVO.tilesTypeAry[y][x] < 1 || mapVO.tilesTypeAry[y][x] >= this.allTile.length) continue;
					p = get45(x,y);
					p.x += bitmapRect.x;
					bitmap.bitmapData.copyPixels(allTile[mapVO.tilesTypeAry[y][x]-1],allTile[mapVO.tilesTypeAry[y][x]].rect,p,null,null,true);
				}
			}
			bitmap.bitmapData.unlock();
		}
		
		public function get45(x:int,y:int):Point
		{
			return new Point((x * tileSize.width - y *  tileSize.width)/2,(x * tileSize.height + y * tileSize.height)/2);
		}
	}
}