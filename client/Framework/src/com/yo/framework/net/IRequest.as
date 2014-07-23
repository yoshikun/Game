package com.yo.framework.net
{
    public interface IRequest
    {
        function write(p:Packet):void;
		
        function get module():uint;
		
        function get action():uint;
    }
}