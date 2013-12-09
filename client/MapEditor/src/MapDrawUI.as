package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.filters.GlowFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.ui.Keyboard;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.core.UIComponent;
	import mx.utils.StringUtil;
	
	import spark.primitives.Rect;
	
	import utils.IsoObject;
	import utils.IsoUtils;
	import utils.Point3D;
	import utils.Res;
	
	import view.BitmapTile;
	import view.GraphicTile;
	import view.IsoTile;
	import view.Layer;
	
	[Bindable]
	public class MapDrawUI extends UIComponent
	{
		//提供工具栏的绑定变量//------------------------
		public var posX:int;
		public var posZ:int;
		
		//成员变量声明//------------------------
		/**地图XML**/
		public var _mapXML:XML;
		/**当前资源索引，-1表示未选择**/
		public var _resIndex:int=-1;
		/**资源XML配置文件名**/
		public var _resFileName:String;
		/**地图宽度**/
		private var _mapWidth:uint;
		/**地图高度**/
		private var _mapHeight:uint;
		/**图块尺寸**/
		private var _tileSize:uint;
		/**所有层的舞台**/
		private var _layerStage:Sprite;
		/**可绘画层**/
		private var _layerDraw:Array=new Array();
		/**当前层的索引**/
		private var _layerIndex:int=0;
		/**网格层**/
		private var _layerGrid:Sprite;
		/**画笔对象的数据**/
		private var _pen:BitmapData;
		/**画笔**/
		private var _penView:Bitmap=new Bitmap();
		/**画笔状态，0选择模式，1绘制模式**/
		private var _penMode:int=1;
		/**绘制中？**/
		private var _brushing:Boolean;	
		/**事件代码**/
		private var _eventCode:String;	
		/**上次鼠标位置，用于避免在同一位置绘制多次**/
		private var _oldPosition:Point3D=new Point3D(0,0,0);
		/**当前选中的对象**/
		private var _currentSelectObj:IsoObject;
		/**选中对象时应用的滤镜效果**/
		private var _filter:GlowFilter=new GlowFilter(0x0000ff,1,6,6,6,1,true);
		
		//常量声明//-----------------------------
		/**地表层索引**/
		public static const LAYER_FLOOR:int = 0;
		/**景物层索引**/
		public static const LAYER_WORLD:int = 1;
		/**事件层索引**/
		public static const LAYER_EVENT:int = 2;
		/**通断设置层索引**/
		public static const LAYER_SETTING:int = 3;
		/**画笔状态,擦除模式**/
		public static const PEN_MODE_ERASER:int = 0;
		/**画笔状态,绘制模式**/
		public static const PEN_MODE_DRAW:int = 1;
		/**画笔状态,选择模式**/
		public static const PEN_MODE_SELECT:int = 2;
		/**地图大小改变**/
		public static const EVENT_SIZECHANGE:String = "sizeChange";	
		
		public function MapDrawUI()
		{
			super();
			_layerStage=new Sprite();
			_layerGrid=new Sprite();
			_layerGrid.mouseEnabled=false;
			_layerStage.addChild(_layerGrid);
			_layerGrid.cacheAsBitmap=true;
			addChild(_layerStage);
			
			this.x=100;
			this.y=100;
			
			_layerStage.addEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
			_layerStage.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
			_layerStage.addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
		}
		private function onMouseUp(e:MouseEvent):void{
			/*结束刷*/
			_brushing=false;
		}
		
		private function onMouseMove(event:MouseEvent):void{
			/*获取当前鼠标位置，并转换坐标*/
			var pos:Point3D=IsoUtils.screenToIso(new Point(_layerStage.mouseX,_layerStage.mouseY));
			pos.x=Math.round(pos.x/_tileSize)*_tileSize;
			pos.z=Math.round(pos.z/_tileSize)*_tileSize;
			
			/*判断当前鼠标所在单元格是否与上次移动鼠标所在的单元格相同
			 *用于避免鼠标在同一单元格内触发多次移动事件而产生多次绘制操作
			 *此判断可提升绘制操作的性能,如果Event传递的是null将强制执行绘制操作*/
			if(Point3D.compare(_oldPosition,pos) && event!=null)
				return;
			_oldPosition=pos;
			posX=Math.round(pos.x/_tileSize);
			posZ=Math.round(pos.z/_tileSize);
			var pt:Point=pos.toPoint();
			var offsetX:Number=Res.getInstance().resXML.tile[_resIndex].@offsetX;
			var offsetY:Number=Res.getInstance().resXML.tile[_resIndex].@offsetY;
			/*移动画笔*/
			_penView.x=pt.x-offsetX;
			_penView.y=pt.y-offsetY;
			
			if(_brushing==false)
				return;
			/*判断当前绘制模式，作不同的操作*/
			if(_penMode==PEN_MODE_ERASER){
				/*擦除模式*/
				erase(pos);
			}else if(_penMode==PEN_MODE_DRAW){
				/*绘制模式*/
				draw(pos);
			}else if(_penMode==PEN_MODE_SELECT){
				/*选择模式*/
				select(pos);
			}
		}
		private function onMouseDown(event:MouseEvent):void{
			/*开始刷*/
			_brushing=true;
			onMouseMove(null);//立即强制绘制一次
		}
		/**擦除模式*/
		private function erase(position:Point3D):void{
			(_layerDraw[_layerIndex] as Layer).delObject(position);
		}
		/**选择模式*/
		private function select(position:Point3D):void{
			if(_currentSelectObj!=null){
				_currentSelectObj.filters=null;
			}
			var obj:IsoObject=(_layerDraw[_layerIndex] as Layer).getObject(position);
			if(obj!=null){
				_currentSelectObj=obj;
				_currentSelectObj.filters=[_filter];
				eventCode=_currentSelectObj.extendMsg;
			}else{
				_currentSelectObj=null;
			}
		}
		/**绘制模式**/
		private function draw(position:Point3D):void{
			if(_resIndex==-1){
				Alert.show("未选择任何元件！","错误：");
				_brushing=false;
				return;
			}
			/*获取信息*/
			var info:XML=Res.getInstance().resXML.tile[_resIndex];
			var size:Number=Res.getInstance().resXML.tile[_resIndex].@size;
			var offsetX:Number=Res.getInstance().resXML.tile[_resIndex].@offsetX;
			var offsetY:Number=Res.getInstance().resXML.tile[_resIndex].@offsetY;
			var tileName:String=Res.getInstance().resXML.tile[_resIndex].@name;
			/*创建显示对象*/
			var object:BitmapTile=new BitmapTile(tileName,size,_pen,offsetX,offsetY);
			if(_layerIndex==LAYER_FLOOR||_layerIndex==LAYER_WORLD){
				/*普通绘图层，统一处理*/
				(_layerDraw[_layerIndex] as Layer).addObject(object,position);
			}else if(_layerIndex==LAYER_SETTING){
				/*通断设置层，单独处理*/
				var walkDisableTile:IsoTile=new IsoTile(_tileSize,0x990000,0x990000);
				(_layerDraw[LAYER_SETTING] as Layer).addObject(walkDisableTile,position);
			}else if(_layerIndex==LAYER_EVENT){
				/*添加一个事件标记块*/
				var eventTile:IsoTile=new IsoTile(_tileSize,0xff00ff,0xff00ff);
				(_layerDraw[LAYER_EVENT] as Layer).addObject(eventTile,position);
			}
		}
		
		/**创建新地图**/
		public function createNewMap(mapWidth:uint,mapHeight:uint,tileSize:uint):void{
			/*赋值新属性*/
			_mapWidth=mapWidth;
			_mapHeight=mapHeight;
			_tileSize=tileSize;
			/*创建四个绘图层*/
			if(_layerDraw.length==0){
				_layerDraw[0]=new Layer(mapWidth,mapHeight,false,true);
				_layerDraw[1]=new Layer(mapWidth,mapHeight,true);
				_layerDraw[2]=new Layer(mapWidth,mapHeight,true);
				_layerDraw[3]=new Layer(mapWidth,mapHeight,false,true);
				_layerStage.addChild(_layerDraw[0]);
				_layerStage.addChild(_layerDraw[1]);
				_layerStage.addChild(_layerDraw[2]);
				_layerStage.addChild(_layerDraw[3]);
			}
			_layerDraw[0].delObjects();
			_layerDraw[1].delObjects();
			_layerDraw[2].delObjects();
			_layerDraw[3].delObjects();
			_layerStage.setChildIndex(_layerGrid,4);
			_layerGrid.removeChildren();
			_layerStage.addChild(_penView);
			//绘制网格
			for(var i:uint=0;i<_mapWidth;i++){
				for(var j:uint=0;j<_mapHeight;j++){
					var tile:IsoTile=new IsoTile(_tileSize,0xff0000);
					tile.position=new Point3D(i*_tileSize,0,j*_tileSize);
					_layerGrid.addChild(tile);
				}
			}
			
			_layerStage.x=mapHeight * tileSize;
			dispatchEvent(new Event(EVENT_SIZECHANGE));
		}
		/**存储地图文件
		 * @param fileName	地图文件名*/		
		public function saveMap(fileName:String):void{
			/*地图信息*/
			var map:XML=
			<map>
				<config resFile={Res.getInstance().resName} mapWidth={_mapWidth} mapHeight={_mapHeight} tileSize={_tileSize}/>
				<layer/>
				<layer/>
				<event/>
				<walkDisable/>
			</map>
			
			/*生成实际上可见的两层，因为第三层为事件层，第四层为通断设置层，不做显示用*/
			for(var i:uint=0;i<2;i++){
				while((_layerDraw[i] as Layer)._objects.length){
					var tile:BitmapTile=(_layerDraw[i] as Layer)._objects.pop() as BitmapTile;
					map.layer[i].appendChild(<tile name={tile.tileName} x={tile.position.x} y={tile.position.y} z={tile.position.z}/>);
				}
			}
			
			/*处理事件层,单独放到event中*/
			while((_layerDraw[2] as Layer)._objects.length){
				var eventObj:IsoTile=(_layerDraw[2] as Layer)._objects.pop() as IsoTile;
				if(StringUtil.trim(eventObj.extendMsg)!="")
					map.event.appendChild(<tile x={eventObj.position.x} y={eventObj.position.y} z={eventObj.position.z} code={eventObj.extendMsg}></tile>);
			}
			
			/*处理通断层,单独放到walkDisable中*/
			while((_layerDraw[3] as Layer)._objects.length){
				var walk:IsoTile=(_layerDraw[3] as Layer)._objects.pop() as IsoTile;
				map.walkDisable.appendChild(<tile x={walk.position.x} y={walk.position.y} z={walk.position.z}/>);
			}
			
			/*保存*/
			/*关于为什么这里没有直接用File.applicationDirectory.resolvePath("map\\"+fileName)生成文件对象？
			 *这是因为Adobe考虑安全问题，不允许直接在应用程序目录下写东西，所以这里通过new创建。使用File Url 代替App URL  */
			var file:File=new File(File.applicationDirectory.resolvePath("map\\"+fileName).nativePath);//保存到map目录中
			var fs:FileStream=new FileStream();
			fs.open(file,FileMode.WRITE);
			fs.writeUTFBytes(map.toXMLString());
			fs.close();
		}
		/**读入地图*/
		public function loadMap(mapXML:XML):void{
			_mapXML=mapXML;
			var mapWidth:int=mapXML.config.@mapWidth;
			var mapHeight:int=mapXML.config.@mapHeight;
			var tileSize:int=mapXML.config.@tileSize;
			_resFileName=mapXML.config.@resFile;
			createNewMap(mapWidth,mapHeight,tileSize);
			Res.getInstance().addEventListener(Res.LOAD_RES_COMPLETE,loadResComplete);
			Res.getInstance().setResFile(_resFileName);
		}
		/**资源配置文件载入完成*/
		private function loadResComplete(e:Event):void{
			Res.getInstance().removeEventListener(Res.LOAD_RES_COMPLETE,loadResComplete);
			Res.getInstance().addEventListener(Event.COMPLETE,buildMap);//所有资源载入完成
			Res.getInstance().loadAllRes();
		}
		/**所有资源载入完成，生成地图*/
		private function buildMap(e:Event):void{
			Res.getInstance().removeEventListener(Event.COMPLETE,buildMap);
			
			var i:uint;	//循环控制用
			var j:uint;	//循环控制用
			
			/*生成实际上可见的两层*/
			for(i=0;i<2;i++){
				for(j=0;_mapXML.layer[i].tile[j]!=null;j++){
					var tileXML:XML=_mapXML.layer[i].tile[j];
					var resName:String=tileXML.@name;//这一步非常重要，之前不能打开地图原因就出在这里，不能直接从XML里面读取属性值作为Dictionary的键！！！(遗忘了Dictionary是使用===来判断的)
					var resInfo:XML=Res.getInstance().getResXMLByName(tileXML.@name);
					var tile:BitmapTile=new BitmapTile(tileXML.@name,resInfo.@size,Res.getInstance().resBitmaps[resName],resInfo.@offsetX,resInfo.@offsetY);
					(_layerDraw[i] as Layer).addObject(tile,new Point3D(tileXML.@x,tileXML.@y,tileXML.@z));
				}
			}
			
			/*事件层*/
			for(i=0;_mapXML.event.tile[i]!=null;i++){
				var eventXML:XML=_mapXML.event.tile[i];
				var eventObj:IsoTile=new IsoTile(_tileSize,0xff00ff,0xff00ff);
				eventObj.extendMsg=String(eventXML.@code);
				(_layerDraw[2] as Layer).addObject(eventObj,new Point3D(eventXML.@x,eventXML.@y,eventXML.@z));
			}
			
			/*通断层*/
			for(i=0;_mapXML.walkDisable.tile[i]!=null;i++){
				var walkXML:XML=_mapXML.walkDisable.tile[i];
				var walkObj:IsoTile=new IsoTile(_tileSize,0x990000,0x990000);
				(_layerDraw[3] as Layer).addObject(walkObj,new Point3D(walkXML.@x,walkXML.@y,walkXML.@z));
			}
			
		}
		/**设置指定层是否可视*/
		public function changeVisible(index:int,_visible:Boolean):void{
			(_layerDraw[index] as Layer).visible=_visible;
		}
		/**当前层索引*/
		public function set layerIndex(value:int):void{
			_layerIndex=value;
			if(_layerIndex!=LAYER_SETTING&&_layerIndex!=LAYER_EVENT)
				_penView.visible=true;
			else
				_penView.visible=false;
		}
		public function get layerIndex():int{
			return _layerIndex;
		}
		/**网格可视*/
		public function set gridVisible(value:Boolean):void{
			_layerGrid.visible=value;
		}
		public function get gridVisible():Boolean{
			return _layerGrid.visible;
		}
		/**画笔模式*/
		public function set penMode(value:int):void{
			_penMode=value;
			if(_penMode==PEN_MODE_DRAW&&_layerIndex!=LAYER_SETTING&&_layerIndex!=LAYER_EVENT){
				_penView.visible=true;
			}else{
				_penView.visible=false;
			}
		}
		public function get penMode():int{
			return _penMode;
		}
		public function set pen(value:BitmapData):void{
			_pen=value;
			_penView.bitmapData=_pen;
			_penView.alpha=0.7;
		}
		/**画笔位图数据*/
		public function get pen():BitmapData{
			return _pen;
		}
		/**地图宽度*/
		public function get mapWidth():Number{
			return _mapWidth;
		}
		/**地图高度*/
		public function get mapHeight():Number{
			return _mapHeight;
		}
		/**地图可见区域宽度*/
		public function get mapPixelWidth():Number{
			return _layerGrid.getBounds(_layerGrid).width;
		}
		/**地图可见区域高度*/
		public function get mapPixelHeight():Number{
			return _layerGrid.getBounds(_layerGrid).height;
		}
		/**区块大小*/
		public function get tileSize():Number{
			return _tileSize;
		}
		public function get eventCode():String{
			return _eventCode;
		}
		public function set eventCode(value:String):void{
			_eventCode=value;
			if(_currentSelectObj)
				_currentSelectObj.extendMsg=eventCode;
		}
	}
}