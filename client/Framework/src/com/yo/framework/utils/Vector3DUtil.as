package com.yo.framework.utils
{
    import flash.geom.Vector3D;

    public class Vector3DUtil
    {
        public function Vector3DUtil()
        {
        }
        
        public static function multiply(v:Vector3D, value:Number):Vector3D
        {
            return new Vector3D(v.x * value, v.y * value, v.z * value);
        }
        
        public static function dist(v1:Vector3D, v2:Vector3D):Number
        {
            return Math.sqrt(distSQ(v1, v2));
        }
        
        public static function distSQ(v1:Vector3D, v2:Vector3D):Number
        {
            var dx:Number = v2.x - v1.x;
            var dy:Number = v2.y - v1.y;
            var dz:Number = v2.z - v1.z;
            return dx * dx + dy * dy + dz * dz;
        }
    }
}