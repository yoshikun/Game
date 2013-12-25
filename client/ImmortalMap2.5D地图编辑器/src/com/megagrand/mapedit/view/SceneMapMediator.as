package com.megagrand.mapedit.view
{
	import com.megagrand.mapedit.model.MapProxy;
	import com.megagrand.mapedit.model.vo.FacadeNotification;
	import com.megagrand.mapedit.model.vo.MapVO;
	import com.megagrand.mapedit.util.MyTile;
	import com.megagrand.mapedit.view.ui.GridLayer;
	import com.megagrand.mapedit.view.ui.PathLayer;
	import com.megagrand.mapedit.view.ui.PathPoint;
	import com.megagrand.mapedit.view.ui.SceneMap;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	
	import ghostcat.display.game.Display45Util;
	import ghostcat.display.game.TileGameLayer;
	import ghostcat.manager.DragManager;
	
	import mx.core.UIComponent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import spark.components.Button;

	/**
	 * 场景编辑地图中介，工具栏上的操作都在这里实现 
	 * @author leo
	 * 
	 */	
	public class SceneMapMediator extends Mediator implements IMediator
	{
		public static const NAME :String = "SceneMapMediator";
		/**方块铺设层*/
		public var tileGameLayer:TileGameLayer;
		/**路径层*/
		public var pathLayer :PathLayer;
		/**网格层*/
		public var gridLayer :GridLayer;
		private static const ADD_TILE :String = "ADD_TILE";
		private static const ADD_PATHPOING :String = "ADD_PATHPOING";
		private static const DELECT :String = "DELECT";
		private var mapProxy:MapProxy;
		private var mapVO :MapVO;
		/**当前选中的对象*/		
		private var curSelectItem :Bitmap;
		/**当前选中对象的名字*/	
		private var curTileName :String;
		/**当前选中的对象的名字*/	
		private var curTileType :int;
		/**方块默认的缩放比例*/
		private var scale :Number = 1;
		/**鼠标左键是否被按下*/
		private var mouseDown:Boolean = false;
		/**路径显示状态*/
		private var pathLayerState :Boolean = false;
		/**网格层显示状态,默认显示*/
		private var gridLayerState :Boolean = true;
		/**鼠标按下后需要增加的类型,默认为TILE*/	
		private var operationType :String = ADD_TILE;
		/**地图缩放默认比例*/
		private var zoomScale :Number = 1;
		/**背景图片*/
		private var bgImg :Bitmap;

		public function SceneMapMediator( viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			
			this.mapProxy = facade.retrieveProxy(MapProxy.NAME) as MapProxy;
			this.sceneMap.addEventListener(Event.ENTER_FRAME,efHandler);
		}
		
		public function get sceneMap():SceneMap
		{
			return this.viewComponent as SceneMap;
		}
		
		/**
		 *  监听感兴趣的通知
		 * @return 
		 * 
		 */		
		public override function listNotificationInterests():Array
		{
			return [
				FacadeNotification.SET_TILE, //设置方块
				FacadeNotification.UI_CONTROL_CLEAR_BRUSH, //清除刷子
				FacadeNotification.UI_CONTROL_DROP,  //手套工具，拖动
				FacadeNotification.UI_CONTROL_RESET_POSITION, //重置位置
				FacadeNotification.UI_CONTROL_PATH_ADD, //增加路径层
				FacadeNotification.UI_CONTROL_PATHPOINT_ADD, //增加路径点
				FacadeNotification.UI_CONTROL_PATH_DELETE, //删除路径层
				FacadeNotification.UI_CONTROL_HIDE_PATH,  //隐藏显示路径层
				FacadeNotification.UI_CONTROL_BRUSH,  //刷子工具,连续填充
				FacadeNotification.UI_CONTROL_DELETE, //删除物品
				FacadeNotification.UI_CONTROL_ZOOMOUT, //放大
				FacadeNotification.UI_CONTROL_ZOOMIN, //缩小
				FacadeNotification.UI_CONTROL_RESET,  //比例重置
				FacadeNotification.UI_CONTROL_HIDE_GRID //隐藏显示网格层
			];
				
		}
		/**
		 * 处理接收到的通知后
		 * @param notification
		 * 
		 */		
		public override function handleNotification(notification:INotification):void
		{
			switch(notification.getName())
			{
				//设置方块
				case FacadeNotification.SET_TILE:
					//填充时取消拖动
					DragManager.unregister(this.tileGameLayer);
					this.curTileName  = notification.getBody() as String;
					var tile :Sprite = this.mapProxy.mapResourceDict[this.curTileName] as Sprite;
					//增加方块前先检测前一个方块是否存在，如果存在则删除
					if ( this.curSelectItem && this.curSelectItem.parent) 
					{
						this.curSelectItem.parent.removeChild(this.curSelectItem);
					}
					this.curSelectItem = spriteToBitmap(tile);
					this.curSelectItem.cacheAsBitmap = true;
					this.tileGameLayer.tileLayer.addChild(curSelectItem);
					this.operationType = ADD_TILE;
					break;
				//清除刷子
				case FacadeNotification.UI_CONTROL_CLEAR_BRUSH:
					clearBrush();
					break;
				//手套移动,只做移动
				case FacadeNotification.UI_CONTROL_DROP:
					if(this.tileGameLayer)
					{
						clearBrush();
						DragManager.register(this.tileGameLayer);
						this.mouseDown = false;
					}
					break;
				//刷子工具，连续填充
				case FacadeNotification.UI_CONTROL_BRUSH:
					if(this.tileGameLayer)
					{
						DragManager.unregister(this.tileGameLayer);
					}
					break;
				//重置位置
				case FacadeNotification.UI_CONTROL_RESET_POSITION:
					if(this.tileGameLayer)
					{
						this.tileGameLayer.x = 0;
						this.tileGameLayer.y = 0;
						DragManager.unregister(this.tileGameLayer);
					}
					break;
				//增加路径层
				case FacadeNotification.UI_CONTROL_PATH_ADD:
					if(this.mapProxy && !this.pathLayer && this.mapVO)
					{
						initPathLayer();
					}
					break;
				//删除路径层
				case FacadeNotification.UI_CONTROL_PATH_DELETE :
					if(this.pathLayer)
					{
						this.pathLayer.parent.removeChild(this.pathLayer);
						this.pathLayer = null;
						this.pathLayerState = false;
						var colsLen :int = this.mapVO.paths.length;
						var rowsLen :int = this.mapVO.paths[0].length;
						for(var i :int = 0; i < colsLen; i++)
						{
							for(var j :int = 0; j < rowsLen; j++)
							{
								this.mapVO.paths[i][j] = 0;
								this.mapVO.pathsObjAry[i][j] = null;
							}
						}
					}
					break;
				//隐藏显示路径层
				case FacadeNotification.UI_CONTROL_HIDE_PATH :
					var btnHidePaht :Button = notification.getBody() as Button;
					if(this.pathLayer)
					{
						if(this.pathLayerState)
						{
							this.pathLayer.visible = false;
							this.pathLayerState = false;
							btnHidePaht.label = "显示路径层";
						}else
						{
							this.pathLayer.visible = true;
							this.pathLayerState = true;
							btnHidePaht.label = "隐藏路径层";
						}
					}
					break;
				//增加路径点
				case FacadeNotification.UI_CONTROL_PATHPOINT_ADD :
					if(!this.tileGameLayer) return;
					clearBrush();
					this.operationType = ADD_PATHPOING;
//					DragManager.unregister(this.tileGameLayer);
					break;
				//删除物品对象
				case FacadeNotification.UI_CONTROL_DELETE :
					if(!this.tileGameLayer) return;
					clearBrush();
					this.operationType = DELECT;
//					DragManager.unregister(this.tileGameLayer);
					break;
				 //地图放大
				case FacadeNotification.UI_CONTROL_ZOOMOUT :
					if(!this.tileGameLayer) return;
					if(this.zoomScale <= 2)
					{
						this.zoomScale+= 0.1;
						this.sceneMap.scaleX = this.zoomScale;
						this.sceneMap.scaleY = this.zoomScale;
					}
					break;
				//地图缩小
				case FacadeNotification.UI_CONTROL_ZOOMIN :
					if(!this.tileGameLayer) return;
					if(this.zoomScale >= 0.1)
					{
						this.zoomScale-= 0.1;
						this.sceneMap.scaleX = this.zoomScale;
						this.sceneMap.scaleY = this.zoomScale;
					}
					break;
				//地图比例重置
				case FacadeNotification.UI_CONTROL_RESET :
					if(!this.tileGameLayer) return;
					this.zoomScale = 1;
					this.sceneMap.scaleX = this.zoomScale;
					this.sceneMap.scaleY = this.zoomScale;
					break;
				//隐藏网格层
				case FacadeNotification.UI_CONTROL_HIDE_GRID :
					var btnHideGrid :Button = notification.getBody() as Button;
					if(this.gridLayer)
					{
						if(this.gridLayerState)
						{
							this.gridLayer.visible = false;
							this.gridLayerState = false;
							btnHideGrid.label = "显示网格层";
						}else
						{
							this.gridLayer.visible = true;
							this.gridLayerState = true;
							btnHideGrid.label = "隐藏网格层";
						}
					}
					break;
				//隐藏背景图
			}
		}
		
		/**
		 * 初始化tileGameLayer层 
		 */		
		public function initTileGameLayer(bmp :Bitmap = null,px :int=0,py:int=0):void
		{
			this.mapVO = (facade.retrieveProxy(MapProxy.NAME) as MapProxy).mapVO;
			var mapRows :int = this.mapVO.width;
			var mapCols :int = this.mapVO.height;
			var tileWidth :Number = this.mapVO.tileWidth;
			var tielHeight :Number = this.mapVO.tileHeight;
			tileGameLayer = new TileGameLayer(this.mapVO.tilesTypeAry,
				new MyTile(mapRows,mapCols,tileWidth,tielHeight),
				createTileHandler);
			this.tileGameLayer.addEventListener(MouseEvent.CLICK,mouseHandler);
			this.tileGameLayer.addEventListener(MouseEvent.MOUSE_DOWN,mouseHandler);
			this.tileGameLayer.addEventListener(MouseEvent.MOUSE_MOVE,mouseHandler);
			this.tileGameLayer.addEventListener(MouseEvent.MOUSE_UP,mouseHandler);
			this.bgImg = bmp;
			if(this.bgImg)
			{
				this.bgImg.x = -this.bgImg.width/2 + px;
				this.bgImg.y = py;
				this.bgImg.alpha = 1;
				this.tileGameLayer.addChild(this.bgImg);
			}
			this.gridLayer = new GridLayer(mapRows,mapCols,tileWidth,tielHeight);
			this.tileGameLayer.addChild(this.gridLayer);
			this.sceneMap.addChild(this.tileGameLayer);
		}
		/**
		 * 初始化背景图层
		 */		
//		public function initBackgroundLayer(bmp :Bitmap,px :Number=0,py:Number=0):void
//		{
//			var bmp :Bitmap = new bmd() as Bitmap;
//			bmp.x = -bmp.width/2 + 20;
//			bmp.y = -285;
//			bmp.alpha = .6;
//			this.tileGameLayer.addChild(bmp);
//		}
		/**
		 * 初始化路径层 
		 */		
		public function initPathLayer():void
		{
			var mapRows :int = this.mapVO.width;
			var mapCols :int = this.mapVO.height;
			var tileWidth :Number = this.mapVO.tileWidth;
			var tielHeight :Number = this.mapVO.tileHeight;
			this.pathLayer = new PathLayer(mapRows,mapCols,tileWidth,tielHeight);
			this.tileGameLayer.addChild(this.pathLayer);
			this.pathLayerState = true;
		}
		protected function createTileHandler(d:*):*
		{
			return null;
		}
		
		/**
		 * sprite转bitmap 
		 * @param sprite
		 * @return 
		 */		
		private function spriteToBitmap(sprite:Sprite):Bitmap
		{
			var matrix:Matrix = new Matrix();
			matrix.translate(this.mapVO.tileWidth/(2*scale),0);
			matrix.scale(scale, scale);          //缩放比例
			var bitmapData:BitmapData = new BitmapData(this.mapVO.tileWidth,this.mapVO.tileHeight,true,0xffffff);
			bitmapData.draw(sprite, matrix);
			return new Bitmap(bitmapData, "auto");                
		}
		/**
		 *  点击添加地形
		 */		
		private function mouseHandler(event :MouseEvent):void
		{
			if(this.operationType == ADD_TILE)
			{
				if(!curSelectItem) return;
			}
			var index:Point = tileGameLayer.tileLayer.getItemPointAtPoint(new Point(this.tileGameLayer.mouseX,this.tileGameLayer.mouseY));
			switch(event.type)
			{
				case MouseEvent.MOUSE_DOWN:
					this.mouseDown = true;
					break;
				case MouseEvent.MOUSE_UP:
					this.mouseDown = false;
					break;
				case MouseEvent.MOUSE_MOVE:
					if(mouseDown)
					{
						//批量增加
						if(this.operationType == ADD_TILE || this.operationType == ADD_PATHPOING)
						{
							if(index.x > this.mapVO.width - 1 || index.y > this.mapVO.height -1 || index.x < 0 || index.y < 0) return;
							addObj(index);
						}
						//批量删除
						if(this.operationType == DELECT)
						{
							delectObj(index);
						}
					}
					break;
				case MouseEvent.CLICK:
					// 鼠标所在TILE的坐标
					if(index.x > this.mapVO.width - 1 || index.y > this.mapVO.height -1 || index.x < 0 || index.y < 0) return;
					//鼠标点击增加
					if(this.operationType == ADD_TILE || this.operationType == ADD_PATHPOING) 
					{
						addObj(index);
					}
					//鼠标点击删除
					if(this.operationType == DELECT)
					{
						delectObj(index);
					}
					break;
			}
		}
		/**
		 * 添加或替换方块地形 
		 * @param index
		 */		
		private function addObj(index :Point):void
		{
			//如果是加地形
			if(this.operationType == ADD_TILE)
			{
				var typeIndex:int = this.curTileName.indexOf("e") + 1;
				var tileType :int = int(this.curTileName.substr(typeIndex));
				//如果类型相同，返回
				if(tileType == this.mapVO.tilesTypeAry[index.y][index.x])
				{
					return;
				}
				//如果当前的方块存在，则删除
				if(this.mapVO.tilesObjAry[index.y][index.x] as Bitmap)
				{
					(this.mapVO.tilesObjAry[index.y][index.x] as Bitmap).bitmapData = this.curSelectItem.bitmapData;
					if(curSelectItem.parent)
					{
						curSelectItem.parent.removeChild(curSelectItem);
//						curSelectItem.bitmapData.dispose();
//						curSelectItem.bitmapData = null;
					}
				}
				else
				{
					// 90度角坐标
					var t90:Point = new Point(index.x * this.mapVO.tileWidth,index.y * this.mapVO.tileHeight);
					// 45度角坐标
					var t45:Point = Display45Util.trans90To45(t90);
					
					this.curSelectItem.x = t45.x - this.mapVO.tileWidth/2;
					this.curSelectItem.y = t45.y;
					this.mapVO.tilesObjAry[index.y][index.x] = this.curSelectItem as Bitmap;
				}
				
				this.curTileType = tileType;
				this.curSelectItem = null;
				sendNotification(FacadeNotification.SET_TILE,this.curTileName);
				//改变小地图显示
				this.mapProxy.setTile(index.x,index.y,tileType);
			}
			
			//如果是加路径点
			if(this.operationType == ADD_PATHPOING)
			{
				if(pathLayer && this.pathLayer.visible == true)
				{
					var pathPoint :Bitmap = this.mapVO.pathsObjAry[index.y][index.x];
					
					// 90度角坐标
					var p90:Point = new Point(index.x * this.mapVO.tileWidth + this.mapVO.tileWidth/4,index.y * this.mapVO.tileHeight + this.mapVO.tileHeight/2);
					// 45度角坐标
					var p45:Point = Display45Util.trans90To45(p90);
					//增加路径点，同时修改路径数组
					if(!pathPoint)
					{
						pathPoint = pathPointToBitmap(new PathPoint());
						pathPoint.cacheAsBitmap = true;
						pathPoint.x = p45.x;
						pathPoint.y = p45.y;
						this.mapVO.pathsObjAry[index.y][index.x] = pathPoint;
						this.mapVO.paths[index.y][index.x] = 1;
						this.pathLayer.addChild(pathPoint);
					}
				}
			}
		}
		/**
		 * 删除方块或路径点 
		 * @param index
		 */		
		private function delectObj(index :Point):void
		{
			//如果路径层存在，先删路径
			if(this.pathLayerState)
			{
				var pathsObjAry :Array = this.mapVO.pathsObjAry;
				var pathsAry :Array = this.mapVO.paths;
				var pathPoint :Bitmap = pathsObjAry[index.y][index.x] as Bitmap;
				if(pathPoint)
				{
					pathPoint.parent.removeChild(pathPoint);
					pathPoint.bitmapData.dispose();
					pathPoint.bitmapData = null;
					pathsObjAry[index.y][index.x] = null;
					pathsAry[index.y][index.x] = 0;
				}
			}else  //如果路径不存在或隐藏状态,则删方块
			{
				var tilesObjAry :Array = this.mapVO.tilesObjAry;
				var tilesTypeAry :Array = this.mapVO.tilesTypeAry;
				var tile :Bitmap = tilesObjAry[index.y][index.x] as Bitmap;
				if(tile)
				{
					tile.parent.removeChild(tile);
					tile.bitmapData.dispose();
					tile.bitmapData = null;
					tilesObjAry[index.y][index.x] = null;
					tilesTypeAry[index.y][index.x] = 0;
				}
			}
		}
		/**
		 * 清除刷子内容
		 */		
		private function clearBrush():void
		{
			if(tileGameLayer)
			{
				DragManager.unregister(this.tileGameLayer);
				if(this.curSelectItem)
				{
					if(this.tileGameLayer.tileLayer.contains(curSelectItem))
					{
						this.tileGameLayer.tileLayer.removeChild(curSelectItem);
						this.curSelectItem = null;
					}else
					{
						return;
					}
				}
			}
			if(this.operationType)
			{
				this.operationType = "";
			}
		}
		/**
		 * 路径点转bitmap 
		 * @param pathPoint
		 * @return 
		 * 
		 */		
		private function pathPointToBitmap(pathPoint:PathPoint):Bitmap
		{
			var matrix:Matrix = new Matrix();
			matrix.translate(pathPoint.pointWidth/(2*scale),0);
			matrix.scale(scale, scale);          //缩放比例
			var bitmapData:BitmapData = new BitmapData(pathPoint.pointWidth,pathPoint.pointHeight,true,0xffffff);
			bitmapData.draw(pathPoint);
			return new Bitmap(bitmapData, "auto");    
		}
		/**
		 * 方块跟随鼠标移动
		 */		
		private function efHandler(event :Event):void
		{
			if(!curSelectItem) return;
			var p :Point = new Point(this.tileGameLayer.mouseX - this.mapVO.tileWidth/2,tileGameLayer.mouseY - this.mapVO.tileHeight/2);
			this.curSelectItem.x = p.x;
			this.curSelectItem.y = p.y;
		}

	}
}