package com.yo.net
{
    import flash.events.Event;

    public class ProtocolEvent extends Event
    {
        public var response:IResponse;
        
        public function ProtocolEvent(type:String, response:IResponse) {
           	this.response = response;
            super(type);
        }
    }
}