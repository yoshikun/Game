package view
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	import utils.IsoObject;
	import utils.Point3D;
	
	public class Layer extends Sprite
	{
		
		public var _objects:Array=new Array();
		public var _sortDepth:Boolean;
		
		/**Layer构造函数
		 * @param mapWidth	地图宽度
		 * @param mapHeight	地图高度
		 * @param sortDepth	是否深度排序
		 * @param cacheAsBitmap 缓存以提高包含复杂矢量内容的显示对象的性能。*/		
		public function Layer(mapWidth:uint,mapHeight:uint,sortDepth:Boolean=false,cacheAsBitmap:Boolean=false)
		{
			super();
			this._sortDepth=sortDepth;
			this.cacheAsBitmap=cacheAsBitmap;
		}
		/**深度排序**/
		private function sort():void{
			if(_sortDepth==false)
				return;
			_objects.sortOn("depth",Array.NUMERIC);
			for(var i:uint=0;i<_objects.length;i++){
				this.setChildIndex(_objects[i],i);
			}
		}
		/**在指定位置添加对象
		 * @param object	要添加的对象
		 * @param position	添加的位置 */		
		public function addObject(object:IsoObject,position:Point3D):void{
			/*移除当前位置的其他对象*/
			for(var i:int=0;i<_objects.length;i++){
				if(Point3D.compare(position,_objects[i].position)){
					removeChild(_objects[i]);
					_objects.splice(i,1);
					break;
				}
			}
			/*添加对象*/
			_objects.push(object);
			addChild(object);
			object.position=position;
			sort();
		}
		/**在指定位置删除对象
		 * @param position	指定位置 */		
		public function delObject(position:Point3D):void{
			/*移除当前位置的对象*/
			for(var i:int=0;i<_objects.length;i++){
				if(Point3D.compare(position,_objects[i].position)){
					removeChild(_objects[i]);
					_objects.splice(i,1);
					break;
				}
			}
			sort();
		}
		/**在指定位置取得对象
		 * @param position	指定位置 */	
		public function getObject(position:Point3D):IsoObject{
			var retVlaue:IsoObject;
			for(var i:int=0;i<_objects.length;i++){
				if(Point3D.compare(position,_objects[i].position)){
					retVlaue=_objects[i] as IsoObject;
				}
			}
			return retVlaue;
		}
		/**删除所有物体*/		
		public function delObjects():void{
			removeChildren();
			_objects.length=0;
		}
	}
}