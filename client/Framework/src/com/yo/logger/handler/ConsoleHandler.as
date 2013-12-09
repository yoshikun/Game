package com.yo.logger.handler
{
    import com.yo.logger.LogHandler;
    import com.yo.logger.LogLevel;
    
    import flash.external.ExternalInterface;
    
    public class ConsoleHandler extends LogHandler
    {
        public function ConsoleHandler()
        {
            super();
        }
        
        override protected function output(m:String):void {
            var levelName:String = LogLevel.getName(_message.level).toLowerCase();
            if (ExternalInterface.available)
                ExternalInterface.call("console." + levelName, m);
        }
    }
}