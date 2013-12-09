package utils
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	public class IsoObject extends Sprite
	{
		
		protected var _position:Point3D;
		protected var _size:Number;
		protected var _walkable:Boolean=false;
		/**扩展信息**/
		public var extendMsg:String;
		public static const Y_CORRECT:Number=Math.cos(-Math.PI/6)*Math.SQRT2;
		
		public function IsoObject(size:Number)
		{
			_size=size;
			_position=new Point3D(0,0,0);
			updateScreenPosition();
		}
		public function updateScreenPosition():void{
			var screenPos:Point=_position.toPoint();
			super.x=screenPos.x;
			super.y=screenPos.y;
		}
		public function set position(position:Point3D):void{
			_position=position;
			updateScreenPosition();
		}
		public function get position():Point3D{
			return _position;
		}
		public function setPosition(x:Number,y:Number,z:Number):void{
			_position=new Point3D(x,y,z);
			updateScreenPosition();
		}
		override public function set x(value:Number):void{
			_position.x=value;
			updateScreenPosition();
		}
		override public function set y(value:Number):void{
			_position.y=value;
			updateScreenPosition();
		}
		override public function set z(value:Number):void{
			_position.z=value;
			updateScreenPosition();
		}
		override public function get x():Number{
			return _position.x;
		}
		override public function get y():Number{
			return _position.y;
		}
		override public function get z():Number{
			return _position.z;
		}
		//获得深度
		public function get depth():Number{
			return (_position.x+_position.z)*0.866 - _position.y*0.707;
		}
		public function get walkable():Boolean{
			return _walkable;
		}
		public function set walkable(value:Boolean):void{
			_walkable=value;
		}
		public function get size():Number{
			return _size;
		}
		public function get rect():Rectangle{
			return new Rectangle(x-size/2,z-size/2,size,size);
		}
	}
}