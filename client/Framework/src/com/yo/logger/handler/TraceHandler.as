package com.yo.logger.handler
{
	import com.yo.logger.LogHandler;

    public class TraceHandler extends LogHandler
    {
        public function TraceHandler()
        {
            super();
        }
        
        override protected function output(m:String):void {
            trace(m);
        }
    }
}