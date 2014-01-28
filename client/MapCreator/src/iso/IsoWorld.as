package iso 
{
	import flash.display.Sprite;
	
	public class IsoWorld extends Sprite
	{
		private var _floor:Sprite;
		private var _objects:Array;
		private var _world:Sprite;
		private var _cols:uint=10;
		private var _rows:uint=10;
		private var _cellSize:uint=20;
		
		public function IsoWorld(cols:uint=10,rows:uint=10,cellSize:uint=20)
		{
			this._cols = cols;
			this._rows = rows;
			this._cellSize = cellSize;
			
			_floor = new Sprite();
			this.addChild(_floor);
			
			_world = new Sprite();
			this.addChild(_world);
			
			_objects = new Array();
		}
		
		public function set cellSize(v:uint):void{
			this._cellSize = v;
		}
		
		public function get cellSize():uint{
			return this._cellSize;
		}
		
		public function set rows(v:uint):void{
			this._rows = v;
		}
		
		public function get rows():uint{
			return this._rows;
		}
		
		public function set cols(v:uint):void{
			this._cols = v;
		}
		
		public function get cols():uint{
			return this._cols;
		}
		
		public function addChildToWorld(child:IsoObject):void
		{
			//检测box的位置是否挂出去了+重复创建检测
			if (child.position.x<0 || child.position.x>(_cols-1)*_cellSize || child.position.z<0 || child.position.z>(_rows-1)*_cellSize || childPosExist(child.position)){
				return;
			}
			
			_world.addChild(child);
			_objects.push(child);
			sort();
		}
		
		public function addChildToFloor(child:IsoObject):void
		{
			_floor.addChild(child);
		}
		
		public function sort():void
		{
			_objects.sortOn("depth", Array.NUMERIC);
			for(var i:int = 0; i < _objects.length; i++)
			{
				_world.setChildIndex(_objects[i], i);
			}
		}
		
		
		private function childPosExist(p:Point3D):Boolean{
			for(var i:int = 0; i < _objects.length; i++)
			{       
				var b:* = _objects[i];              
				if (b is IsoObject ){                   
					if (b.position.equal(p)){                       
						return true;                        
					}
				}
			}
			return false;
		}
		
	}
}