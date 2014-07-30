package com.yo.framework.objects.movement
{
    import flash.events.Event;
    
    public class MovementEvent extends Event
    {
        public static const ARRIVED:String = "arrived";
        
        public function MovementEvent(type:String)
        {
            super(type);
        }
    }
}