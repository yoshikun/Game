package com.yo.framework.logger.handler
{
	import com.yo.framework.logger.LogHandler;

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