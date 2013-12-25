package com.megagrand.mapedit.controller
{
	import com.megagrand.mapedit.model.MapProxy;
	import com.megagrand.mapedit.model.vo.MapVO;
	import com.megagrand.mapedit.util.MapAssetsManager;
	import com.megagrand.mapedit.view.SceneMapMediator;
	import com.megagrand.mapedit.view.ui.PathLayer;
	import com.megagrand.mapedit.view.ui.PathPoint;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	import ghostcat.display.game.Display45Util;
	import ghostcat.display.game.TileGameLayer;
	import ghostcat.text.NumberUtil;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	/**
	 * 还原地图命令 
	 * @author leo
	 * 
	 */	
	public class RestoreMapCommand extends SimpleCommand implements ICommand
	{
		private var mapVO :MapVO;
		private var mapProxy :MapProxy;
		private var sceneMapdediator :SceneMapMediator;
		private var scale :Number = 1;
		private var swfLoader :Loader;
		private var imgLoader :Loader;
		private var bgImg :Bitmap;
		public function RestoreMapCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			this.mapVO = notification.getBody() as MapVO;
			this.sceneMapdediator = facade.retrieveMediator(SceneMapMediator.NAME) as SceneMapMediator;
			this.mapProxy = facade.retrieveProxy(MapProxy.NAME) as MapProxy;
			for(var i :int = 0; i < this.sceneMapdediator.sceneMap.numChildren; i++)
			{
				this.sceneMapdediator.sceneMap.removeChildAt(i);
			}
			loadImg();
		}
		private function restoreMap(bmp :Bitmap = null):void
		{
			//初始化网格层、tileGameLayer层
			sceneMapdediator.initTileGameLayer(bmp,this.mapVO.px,this.mapVO.py);
			sceneMapdediator.initPathLayer();
			//加载图元库资源，小地图显示
			
			var file :File = new File(this.mapVO.swfPath);
			if(!file.exists)
			{
				 var index :int = this.mapVO.resetSwfPath.lastIndexOf(".");
				 var str :String = this.mapVO.resetSwfPath.substr(0,index) + ".swf";
				 trace(str);
				 file = new File(str);
				 this.mapVO.swfPath = str;
			}
			var fileStream :FileStream = new FileStream();
			fileStream.open(file,FileMode.READ);
			var fileData :ByteArray = new ByteArray();
			fileStream.readBytes(fileData,0,fileStream.bytesAvailable);
			fileStream.close();
			MapAssetsManager.getInstance().sourceLoader(fileData);
			
			//获取加在地图上的资源
			this.swfLoader = new Loader();
			swfLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,loadCompleteHandler);
			swfLoader.load(new URLRequest(this.mapVO.swfPath));
		}
		private function loadCompleteHandler(event :Event):void
		{
			var loaderInfo :LoaderInfo = (event.currentTarget) as LoaderInfo;
			var mapResourceDict :Dictionary = this.mapProxy.mapResourceDict;
			for (var k:int = 1 ; ; k++)
			{
				//如果资源数小于2位数则在前面补个0
				var tileName:String = "map.Tile" + NumberUtil.fillZeros(k.toString(),2,"0");
				if(loaderInfo.applicationDomain.hasDefinition(tileName))
				{
					//从安全域中取出资源    
					var className :Class = loaderInfo.applicationDomain.getDefinition(tileName) as Class;
					var sp :Sprite = new className() as Sprite;
					var index :int = tileName.indexOf(".") + 1;
					var newName :String = tileName.substring(index);
					mapResourceDict[newName] = sp;
				} else
				{
					break;
				}
			}
			//还原方块
			var tilesTypeAry :Array = this.mapVO.tilesTypeAry;
			var tileName2 :String;
			for(var row :int = 0; row < tilesTypeAry.length; row++)
			{
				for(var col :int  = 0; col < tilesTypeAry[0].length; col++)
				{
					if(tilesTypeAry[row][col] != 0)
					{
						tileName2 = "Tile" + NumberUtil.fillZeros(tilesTypeAry[row][col].toString(),2,"0");
						var bitmap :Bitmap = spriteToBitmap(mapResourceDict[tileName2] as Sprite);
						var p90 :Point = new Point(col * this.mapVO.tileWidth,row * this.mapVO.tileHeight);
						var p45 :Point = Display45Util.trans90To45(p90);
						bitmap.x = p45.x - this.mapVO.tileWidth/2;
						bitmap.y = p45.y;
						this.mapVO.tilesObjAry[row][col] = bitmap;
						this.sceneMapdediator.tileGameLayer.tileLayer.addChild(bitmap);
					}
				}
			}
			this.swfLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE,loadCompleteHandler);
			
			//还原路径点
			var pathsAry :Array = this.mapVO.paths;
			for(var i :int = 0; i < pathsAry.length; i++)
			{
				for(var j:int = 0; j < pathsAry[0].length; j++)
				{
					//1为不可通行
					if(pathsAry[i][j] == 1)
					{
						var pathPoint :PathPoint = new PathPoint();
						var point90 :Point = new Point(j * this.mapVO.tileWidth + this.mapVO.tileWidth/2,i * this.mapVO.tileHeight + this.mapVO.tileHeight/2);
						var point45 :Point = Display45Util.trans90To45(point90);
						pathPoint.x = point45.x;
						pathPoint.y = point45.y;
						this.mapVO.pathsObjAry[i][j] = pathPoint;
						this.sceneMapdediator.pathLayer.addChild(pathPoint);
					}
				}
			}
			
		}
		/**
		 * sprite转bitmap 
		 * @param sprite
		 * @return bitmap
		 */		
		private function spriteToBitmap(sprite:Sprite):Bitmap
		{
			var matrix:Matrix = new Matrix();
			matrix.translate(mapProxy.mapVO.tileWidth/(2*scale),0);
			matrix.scale(scale, scale);          //缩放比例
			var bitmapData:BitmapData = new BitmapData(mapProxy.mapVO.tileWidth,mapProxy.mapVO.tileHeight,true,0x00ffffff);
			bitmapData.draw(sprite, matrix);
			return new Bitmap(bitmapData, "auto");                
		}
		
		private function loadImg():void
		{
			if(this.mapVO.imgPath.indexOf("\\") != -1 )
			{
				this.imgLoader = new Loader();
				this.imgLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,imgLoadCompleteHandler);
				this.imgLoader.load(new URLRequest(this.mapVO.imgPath));
			}else
			{
				restoreMap();
			}
		}
		private function imgLoadCompleteHandler(event :Event):void
		{
			var bmp :Bitmap = (event.target as LoaderInfo).content as Bitmap;
			restoreMap(bmp);
			this.imgLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE,imgLoadCompleteHandler);
		}
	}
}