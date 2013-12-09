package com.yo.net
{
    public interface IProtocol
    {
        function lookup(module:uint, action:uint):IResponse;
    }
}