package utils
{
	import flash.geom.Point;
	
	import iso.Point3D;

	public class IsoUtils{
		public static const Y_CORRECT:Number=Math.cos(-Math.PI/6)*Math.SQRT2;
		
		public static function screenToIso(point:Point):Point3D{
			var xpos:Number=point.y+point.x*0.5;
			var ypos:Number=0;
			var zpos:Number=point.y-point.x*0.5;
			return new Point3D(xpos,ypos,zpos);
		}
		public static function isoToScreen(point:Point3D):Point{
			var xpos:Number=point.x-point.z;
			var ypos:Number=point.y*Y_CORRECT+(point.x+point.z)*0.5;
			return new Point(xpos,ypos);
		}
	}
}