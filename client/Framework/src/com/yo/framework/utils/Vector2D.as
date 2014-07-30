package com.yo.framework.utils
{
	import flash.display.Graphics;
	import flash.geom.Point;
	
	public class Vector2D
	{
		public var x:Number;
		public var y:Number;
		
		public function Vector2D(x:Number = 0, y:Number = 0)
		{
			this.x = x;
			this.y = y;
		}
		
		public function set(x:Number = 0, y:Number = 0):void {
			this.x = x;
			this.y = y;
		}
		
		public static function create(x:Number = 0, y:Number = 0):Vector2D {
			return new Vector2D(x, y);
		}
		
		public function dispose():void {
		}
		
		public function toPoint():Point {
			return new Point(x, y);
		}
		
		public function draw(graphics:Graphics, color:uint = 0):void
		{
			graphics.lineStyle(0, color);
			graphics.moveTo(0, 0);
			graphics.lineTo(x, y);
		}
		
		public function clone():Vector2D
		{
			return new Vector2D(x, y);
		}
		
		public function zero():Vector2D
		{
			x = 0;
			y = 0;
			return this;
		}
		
		public function isZero():Boolean
		{
			return x == 0 && y == 0;
		}
		
		public function set length(value:Number):void
		{
			var a:Number = angle;
			x = Math.cos(a) * value;
			y = Math.sin(a) * value;
		}
		public function get length():Number
		{
			return Math.sqrt(lengthSQ);
		}
		
		public function get lengthSQ():Number
		{
			return x * x + y * y;
		}
		
		public function set angle(value:Number):void
		{
			var len:Number = length;
			x = Math.cos(value) * len;
			y = Math.sin(value) * len;
		}
		public function get angle():Number
		{
			return Math.atan2(y, x);
		}
		
		public function normalize():Vector2D
		{
			if(length == 0)
			{
				x = 1;
				return this;
			}
			var len:Number = length;
			x /= len;
			y /= len;
			return this;
		}
		
		public function truncate(max:Number):Vector2D
		{
			length = Math.min(max, length);
			return this;
		}
		
		public function reverse():Vector2D
		{
			x = -x;
			y = -y;
			return this;
		}
		
		public function isNormalized():Boolean
		{
			return length == 1.0;
		}
		
		public function dotProd(v2:Vector2D):Number
		{
			return x * v2.x + y * v2.y;
		}
		
		public function crossProd(v2:Vector2D):Number
		{
			return x * v2.y - y * v2.x;
		}
		
		public static function angleBetween(v1:Vector2D, v2:Vector2D):Number
		{
			if(!v1.isNormalized()) v1 = v1.clone().normalize();
			if(!v2.isNormalized()) v2 = v2.clone().normalize();
			return Math.acos(v1.dotProd(v2));
		}
		
		public function sign(v2:Vector2D):int
		{
			return perp.dotProd(v2) < 0 ? -1 : 1;
		}
		
		public function get perp():Vector2D
		{
			return new Vector2D(-y, x);
		}
		
		public function dist(v2:Vector2D):Number
		{
			return Math.sqrt(distSQ(v2));
		}
		
		public function distSQ(v2:Vector2D):Number
		{
			var dx:Number = v2.x - x;
			var dy:Number = v2.y - y;
			return dx * dx + dy * dy;
		}
		
		public function add(v2:Vector2D):Vector2D
		{
			return Vector2D.create(x + v2.x, y + v2.y);
		}
		
		public function subtract(v2:Vector2D):Vector2D
		{
			return Vector2D.create(x - v2.x, y - v2.y);
		}
		
		public function multiply(value:Number):Vector2D
		{
			return Vector2D.create(x * value, y * value);
		}
		
		public function divide(value:Number):Vector2D
		{
			return Vector2D.create(x / value, y / value);
		}
		
		public function equals(v2:Vector2D):Boolean
		{
			return x == v2.x && y == v2.y;
		}
		
		public function toString():String
		{
			return "[Vector2D (x:" + x + ", y:" + y + ")]";
		}
	}
}
