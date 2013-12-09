package com.yo.logger
{
    import com.yo.logger.handler.ConsoleHandler;
    import com.yo.logger.handler.TraceHandler;
    
    import flash.events.EventDispatcher;
    import flash.utils.getQualifiedClassName;

    /**
     * 基本日志类 
     */    
    public class Log extends EventDispatcher
   {
        private var _logMessage:LogMessage;
        private var _level:uint;
        private var _name:String;
        
        // 所有日志器
        private static var _loggers:Object ={};
		
        private static var traceHandler:TraceHandler = new TraceHandler();
		private static var consoleHandler:ConsoleHandler = new ConsoleHandler();
        
        public function Log(name:String)
       {
            _logMessage = new LogMessage();
            _name = name;
            
            // 默认级别及日志处理器
            _level = LogLevel.ALL;
			
			traceHandler.attach(this);
			consoleHandler.attach(this);
        }
        
        public static function getLog(x:*):Log{
            var name:String;
            if (x is String){
                name = x;
            } else{
                name = getQualifiedClassName(x);
				
				var index:int = name.lastIndexOf('::');
				if (index != -1){
					name = name.slice(name.lastIndexOf('::') + 2)
				}
            }
            var log:Log = _loggers[name];
            if (! log){
                log = new Log(name);
                _loggers[name] = log;
            }
            return log;
        }
        
        public function set level(l:uint):void{
            _level = l;
        }
        
        public function get level():uint{
            return _level;
        }
        
        public function get name():String{
            return _name;
        }
        
        public function debug(...args):void{
            output(LogLevel.DEBUG, args.join(' '));
        }
        
        public function info(...args):void{
            output(LogLevel.INFO, args.join(' '));
        }
        
        public function warn(...args):void{
            output(LogLevel.WARN, args.join(' '));
        }
        
        public function error(...args):void{
            output(LogLevel.ERROR, args.join(' '));
        }
        
        public function output(l:uint, m:String):void{
            // 如果不是在这个日志级别，则返回
            if (!(level & l)){
                return;
            }
            _logMessage.level = l;
            _logMessage.data = m;
            _logMessage.log = this;
            
            var logEvent:LogEvent = new LogEvent(LogEvent.LOG_MESSAGE);
            logEvent.message = _logMessage;
            dispatchEvent(logEvent);
        }
    }
}