package com.yo.framework.logger
{
    /**
     * 日志处理器，日志可挂钩多个日志处理器 
     */    
    public class LogHandler
    {
        protected var _message:LogMessage;
        
        public function LogHandler()
        {
        }
        
        public function attach(l:Log):void {
            l.addEventListener(LogEvent.LOG_MESSAGE, onMessage);
        }
        
        public function detach(l:Log):void {
            l.removeEventListener(LogEvent.LOG_MESSAGE, onMessage);
        }
        
        protected function onMessage(event:LogEvent):void
        {
            _message = event.message;
            var date:Date = new Date();

            var time:String = printf("%H:%M:%S.%j", date, date, date, date);
            var level:String = LogLevel.getName(_message.level);
            var name:String = _message.log.name;
            
            output(printf("[%s %s %s] %s", time, level, name, _message.data));
        }
        
        protected function output(m:String):void {
            
        }
    }
}