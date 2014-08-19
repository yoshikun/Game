package com.yo.framework.utils
{
    import flash.geom.Point;
    import flash.geom.Vector3D;

    public class Transfer
    {
		private static var _instance:Transfer;
		
        public var floorY:int = 0;
		
		public var floorX:int = 0;
		
		public var floorZ:int = 0;
		
        public var cellWidth:uint;
		
		public var cellHeight:uint;
		
		public var maxColumn:int;
		
		public var maxRow:int;
        
        public function Transfer()
        {
        }

        public function speed(mvSpeed:uint):Number
		{
            return cellWidth * 1000 / mvSpeed;
        }
        
        public function cell(x:Number, y:Number):Point
		{
            var p:Point = new Point();
            p.x = getCellX(x);
            p.y = getCellX(y);
            return p;
        }
		
		public function getCellX(x:Number):int{
			return Math.min(Math.max(Math.floor(x / cellWidth), 0), maxColumn);
		}
		
		public function getCellY(y:Number):int{
			return Math.min(Math.max(Math.floor(y / cellHeight), 0), maxRow);
		}
		
		/**
		 * 通过一个世界坐标获取所占的格子索引 
		 */		
		public function getNodeIndex(node:Vector2D):int{
			var col:int = node.x / cellWidth;
			var row:int = node.y / cellHeight;
			if(col >= maxColumn){
				return -1;
			}
			if(row >= maxRow){
				return -1;
			}
			return col + row * maxColumn;
		}
		
		/**
		 * 获取node的中点的坐标
		 */		
		public function getNodeVector(pos:Vector2D):Vector2D{
			return new Vector2D(pos.x * cellWidth + cellWidth / 2, pos.y * cellHeight + cellHeight / 2);
		}

		public function getScreenX(x:Number):Number{
			return x + floorX;
		}
		
		public function getScreenY(y:Number, z:Number = 0):Number{
			return y / 2 + z / Math.SQRT2 + floorY;
		}
		
		public function getWorldX(x:Number):Number{
			return x - floorX;
		}
		
		public function getWorldY(y:Number):Number{
			return(y - floorY) * 2;
		}
		
        public static function face(d:uint):int{
            return Math.cos(Transfer.angle(d)) > 0 ? 1:-1;
        }
        
		/**
		 * 通过方向转换成角度 
		 */		
        public static function angle(direct:uint):Number
		{
            var angle:Number;
            if(direct == 0)
			{
                angle = -90;
            }
			else if(direct == 1)
			{
                angle = -45;
            }
			else if(direct == 2)
			{
                angle = 0;
            }
			else if(direct == 3)
			{
                angle = 45;
            }
			else if(direct == 4)
			{
                angle = 90;
            }
			else if(direct == 5)
			{
                angle = 135;
            }
			else if(direct == 6)
			{
                angle = 180;
            }
			else if(direct == 7)
			{
                angle = -135;
            }
            return angle * Math.PI / 180;
        }
        
		/**
		 * 通过角度转换成方向 
		 */		
        public static function direct(angle:Number):uint
		{
            var direct:int = 0;
            if(angle > 0 && angle < 90)
			{
                direct = 3;
            }
			else if(angle > 90 && angle < 180)
			{
                direct = 5;
            }
			else if(angle < 0 && angle > -90)
			{
                direct = 1;
            }
			else if(angle < -90 && angle > -180)
			{
                direct = 7;
            }
			else if(angle == 0)
			{
                direct = 2;
            }
			else if(angle == 90)
			{
                direct = 4;
            }
			else if(angle == -90)
			{
                direct = 0;
            }
			else if(angle == 180)
			{
                direct = 6
            }
            return direct;
        }
		
		/**
		 * 获取到目标点的角度 
		 */		
		public static function getAngle(source:Vector3D, target:Vector3D):Number
		{
			var distX:Number = target.x - source.x;
			var distY:Number = target.y - source.y;
			return Math.atan2(distY, distX);
		}

		public static function get instance():Transfer
		{
			if(!_instance){
				_instance = new Transfer();
			}
			return _instance;
		}

    }
}