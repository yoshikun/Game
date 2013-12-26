package iso
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import utils.IsoUtils;
	
	public class IsoObject extends Sprite {
		
		protected var _position:Point3D;
		protected var _size:Number;
		protected var _walkable:Boolean=false;
		
		//public static const Y_CORRECT:Number=Math.cos(- Math.PI/6)*Math.SQRT2;
		public static const Y_CORRECT:Number=1.2247448713915892;
		
		public function IsoObject(size:Number) {
			_size=size;
			_position = new Point3D();
			updateScreenPosition();
		}
		
		/**
		 * 更新屏幕坐标位置
		 */		
		protected function updateScreenPosition():void {
			var screenPos:Point=IsoUtils.isoToScreen(_position);
			super.x=screenPos.x;
			super.y=screenPos.y;
		}
		
		override public function toString():String {
			return "[IsoObject (x:" + _position.x + ", y:" + _position.y+ ", z:" + _position.z + ")]";
		}
		
		/**
		 * 设置等角空间3D坐标点的x,y,z值
		 */		
		override public function set x(value:Number):void {
			_position.x=value;
			updateScreenPosition();
		}
		
		override public function get x():Number {
			return _position.x;
		}
		
		override public function set y(value:Number):void {
			_position.y=value;
			updateScreenPosition();
		}
		override public function get y():Number {
			return _position.y;
		}
		
		override public function set z(value:Number):void {
			_position.z=value;
			updateScreenPosition();
		}
		
		override public function get z():Number {
			return _position.z;
		}
		
		public function set position(value:Point3D):void {
			_position=value;
			updateScreenPosition();
		}
		public function get position():Point3D {
			return _position;
		}
		
		/**
		 * 深度排序时会用到，现在不用理这个
		 */		
		public function get depth():Number {
			return (_position.x + _position.z) * .866 - _position.y * .707;
		}
		
		//这个暂时也不用理
		public function set walkable(value:Boolean):void {
			_walkable=value;
		}
		public function get walkable():Boolean {
			return _walkable;
		}
		
		public function get size():Number {
			return _size;
		}
		
		public function get rect():Rectangle {
			return new Rectangle(x - size / 2, z - size / 2, size, size);
		}
	}
}