package com.yo.framework.logger
{
    /**
     * 日志级别 
     */    
    public class LogLevel
    {
        private static const _names:Array = ["DEBUG", "INFO", "WARN", "ERROR"];

        public static const DEBUG:uint  = 0x01;
        public static const INFO:uint   = 0x02;
        public static const WARN:uint   = 0x04;
        public static const ERROR:uint  = 0x08;
        
        public static const ALL:uint = LogLevel.DEBUG | LogLevel.INFO | LogLevel.WARN | LogLevel.ERROR;
		public static const NONE:uint = 0;
        
        public function LogLevel()
        {
            
        }
        
        public static function getName(x:uint):String {
            // 获取位置
            var n:uint = 0;
            if (x != 0)
            {
                x = (x ^ (x - 1)) >> 1;
                while (x != 0) {
                    x >>= 1;
                    n++;
                }
            }
            return _names[n];
        }
    }
}