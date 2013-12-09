package com.yo.logger
{
    import flash.events.Event;
    import flash.events.IEventDispatcher;
    
    public class LogEvent extends Event
    {
        public var message:LogMessage;
        public static var LOG_MESSAGE:String = "log_message";
        
        public function LogEvent(type:String) {
            super(type)
        }
    }
}