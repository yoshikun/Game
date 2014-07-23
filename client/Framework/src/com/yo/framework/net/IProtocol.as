package com.yo.framework.net
{
    public interface IProtocol
    {
        function lookup(module:uint, action:uint):IResponse;
    }
}