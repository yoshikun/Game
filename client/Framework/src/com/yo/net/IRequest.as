package com.yo.net
{
    public interface IRequest
    {
        function write(p:Packet):void;
		
        function get module():int;
		
        function get action():int;
    }
}