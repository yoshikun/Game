package com.yo.framework.utils
{
	/**
	 * 插值工具，计算动画中间值
	 * wiki:http://en.wikipedia.org/wiki/Interpolation
	 * @author Dalton
	 */
	public class Interpolation
	{
		
		public function Interpolation() 
		{
			
		}
		
		public static function tendTowardAngle(a0:Number, a1:Number, speed:Number):Number {
			var da:Number = a1 - a0;
			while (Math.abs(a1 - a0) > 180) {
				a1 = a1 - sgn(a1 - a0) * 360;
			}

			return tendTowards(a0, a1, speed);
		}
		
		private static function tendTowards(a0:Number, a1:Number, speed:Number):Number
		{
			if (Math.abs(a1 - a0) < Math.abs(speed)) {
				return a1;
			}
			if (a1 > a0) 
				return a0 + speed;
			return a0 - speed;
		}
		
		public static function sgn(x:Number):Number {
			if (x < 0)
				return -1;
			if (x == 0)
				return 0;
			return 1;
		}
		
		// 比率
        public static function fromTo(x:Number, x0:Number, x1:Number):Number
        {
            return (x - x0) / (x1 - x0);
        }
		
		// 返回线性插值的y值
        public static function linearInterpolateLock(y0:Number, y1:Number, k:Number, min:Number = 0, max:Number = 1):Number
        {
            return linearInterpolate(y0, y1, lockValue(k, min, max));
        }

		// 返回线性插值的y值
        public static function linearInterpolate(y0:Number, y1:Number, k:Number):Number
        {
            return y0 + (y1 - y0) * k;
        }
		
		public static function squareInterpolateLock(y0:Number, y1:Number, k:Number, min:Number = 0, max:Number = 1):Number
        {
            return squareInterpolate(y0, y1, lockValue(k, 0, 1));
        }
		
        // 平方插值
		public static function squareInterpolate(y0:Number, y1:Number, k:Number):Number
        {
            return y0 + (y1 - y0) * Math.pow(k, 2);
        }
		
		// 锁定选定值
        public static function lockValue(value:Number, min:Number, max:Number):Number
        {
            if (value < min) {
                return min;
            }
            if (value > max) {
                return max;
            }
            return value;
        }
	}

}