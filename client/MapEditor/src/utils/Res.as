package utils
{
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.media.Video;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.utils.Dictionary;

	[Bindable]
	public class Res extends EventDispatcher
	{
		public static const LOAD_RES_COMPLETE:String="loadResComplete";
		
		/**资源包文件的XML**/
		public var resXML:XML;
		/**包含所用已经载入的资源图像**/
		public var resBitmaps:Dictionary=new Dictionary();
		
		private static var _instance:Res;//Res实例引用
		private var _loadToaal:int;//需要载入的资源总数
		private var _loadedNum:int;//已经载入的资源总数
		public var _resName:String;//Res文件名称
		
		public static function getInstance():Res{
			if(_instance==null){
				_instance=new Res();
			}
			return _instance;
		}
		/**指定一个资源包文件名**/
		public function setResFile(resFileName:String):void
		{
			if(resName==resFileName){
				/*与上次加载的文件相同*/
				dispatchEvent(new Event(LOAD_RES_COMPLETE));
				return;
			}
			if(resName!=null || resXML!=null){
				//、、、、、unloadAllRes();
			}
			_resName=resFileName;
			var resLoader:URLLoader=new URLLoader(new URLRequest("res\\"+resFileName));
			resLoader.addEventListener(Event.COMPLETE,function(e:Event):void{
				resXML=XML(resLoader.data);
				dispatchEvent(new Event(LOAD_RES_COMPLETE));
			});
		}
		public function getResXMLByName(_name:String):XML{
			return resXML.tile.(@name==_name)[0];
		}
		public function getResXMLIndex(_index:uint):XML{
			return resXML.tile[_index];
		}
		public function getBitmapDataByName(_name:String):BitmapData{
			return resBitmaps[_name] as BitmapData;
		}
		/**返回需要加载的资源总数**/
		public function get loadToaal():int{
			return _loadToaal;
		}
		/**返回已经加载的资源总数**/
		public function get loadedNum():int{
			return _loadedNum;
		}
		public function get resName():String{
			return _resName;
		}
		/**加载所有资源包里面的资源图片，加载成功后会派发Event.COMPLETE事件。*/		
		public function loadAllRes():void{
			/*将所有name属性值不为空的tile节点放入tiles中*/
			var tiles:XMLList=resXML.tile.(@name);
			/*names用于存放不重复的name属性值*/
			var names:Array=new Array();
			/*判断是否tiles中有还未取出的节点*/
			for(var i:int=0;tiles[i]!=null;i++){
				/*取出一个name属性值，将他存入tname中，并加入到names中。最后在tiles中删除所有具有name值的节点*/
				var tname:String=tiles.@name[i];
				names.push(tname);
			}
			loadResByNames(names);
		}
		/**卸载所有资源包里面的资源图片*/		
		public function unloadAllRes():void{
			for each(var item:BitmapData in resBitmaps){
				item.dispose();
				delete resBitmaps[item];
			}
		}
		private function loadResByNames(names:Array):void{
			_loadToaal=names.length;
			_loadedNum=0;
			while(names.length){
				loadBitmapByResName(names.pop());
			}
		}
		/**统计已经加载的资源总数，负责在加载完成之后派发Event.COMPLETE事件。**/
		private function loadCount():void{
			_loadedNum++;
			if(_loadToaal==_loadedNum){
				dispatchEvent(new Event(Event.COMPLETE));
			}
		}
		/**通过指定的资源名称加载资源文件**/
		private function loadBitmapByResName(resName:String):void{
			var loader:Loader=new Loader();
			var resInfo:XML=resXML.tile.(@name==resName)[0];
			loader.load(new URLRequest("res\\"+resInfo.@type+"\\"+resInfo.@file));
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,function(e:Event):void{
				resBitmaps[resName]=loader.content["bitmapData"];
				loadCount();
			});
		}
	}
}