package com.yo.framework.utils
{
    /**
     * ARGB颜色转换工具 
     * @author Dalton
     * 
     */    
    public class ColorArgb
    {
        public var red:int;
        public var green:int;
        public var blue:int;
        public var alpha:int;
        
        public static function fromRgb(color:uint):ColorArgb
        {
            var rgb:ColorArgb = new ColorArgb();
            rgb.fromRgb(color);
            return rgb;
        }
        
        public static function fromArgb(color:uint):ColorArgb
        {
            var argb:ColorArgb = new ColorArgb();
            argb.fromArgb(color);
            return argb;
        }
        
        public function ColorArgb(red:Number=0, green:Number=0, blue:Number=0, alpha:Number=0)
        {
            this.red = red;
            this.green = green;
            this.blue = blue;
            this.alpha = alpha;
        }
        
        public function toRgb():uint
        {
            var r:int = red;   if (r < 0) r = 0; else if (r > 255) r = 255;
            var g:int = green; if (g < 0) g = 0; else if (g > 255) g = 255;
            var b:int = blue;  if (b < 0) b = 0; else if (b > 255) b = 255;
            
            return r << 16 | g << 8 | b;
        }
        
        public function toArgb():uint
        {
            var a:int = alpha; if (a < 0) a = 0; else if (a > 255) a = 255;
			var r:int = red;   if (r < 0) r = 0; else if (r > 255) r = 255;
			var g:int = green; if (g < 0) g = 0; else if (g > 255) g = 255;
			var b:int = blue;  if (b < 0) b = 0; else if (b > 255) b = 255;
            
			return a << 24 | r << 16 | g << 8 | b;
        }
        
        public function fromRgb(color:uint):void
        {
            red = (color >> 16 & 0xFF);
            green = (color >> 8 & 0xFF);
            blue = (color & 0xFF);
        }
        
        public function fromArgb(color:uint):void
        {
            red = (color >> 16 & 0xFF);
            green = (color >> 8 & 0xFF);
            blue = (color & 0xFF);
            alpha = (color >> 24 & 0xFF);
        }
        
        public function copyFrom(argb:ColorArgb):void
        {
            red = argb.red;
            green = argb.green;
            blue = argb.blue;
            alpha = argb.alpha;
        }
    }
}