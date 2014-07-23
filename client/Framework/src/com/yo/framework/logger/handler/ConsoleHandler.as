package com.yo.framework.logger.handler
{
    import com.yo.framework.logger.LogHandler;
    import com.yo.framework.logger.LogLevel;
    
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