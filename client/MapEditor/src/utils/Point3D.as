package utils
{
	import flash.geom.Point;
	
	public class Point3D{
		public var x:Number;
		public var y:Number;
		public var z:Number;
		public function Point3D(x:Number,y:Number,z:Number){
			this.x=x;
			this.y=y;
			this.z=z;
		}
		public function toPoint():Point{
			return  IsoUtils.isoToScreen(this);
		}
		/**判断两个Point3D是否相等，如果需要比较，请使用此方法
		 * @param A	需要比较的Point3D
		 * @param B	需要比较的Point3D
		 * @return 相等返回true,否则返回false*/		
		public static function compare(A:Point3D,B:Point3D):Boolean{
			if(A.x==B.x && A.y==B.y && A.z==B.z)
				return true;
			else
				return false;
		}
	}
}