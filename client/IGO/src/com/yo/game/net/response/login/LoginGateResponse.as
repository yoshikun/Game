/**
 * Copyright (c) 2012, www.yo.com All rights reserved.
 */
package com.yo.game.net.response.login
{
    import com.yo.framework.net.IResponse;
    import com.yo.game.net.vo.*;
    import com.yo.framework.net.Packet;

    /*@import*/

    /**
     * 登录到网关返回结果(1:8)
     */
    public class LoginGateResponse implements IResponse
    {
        /**
         * 结果 0:成功 1:失败
         */
        public var result:uint;

        public function read(p:Packet):void
        {

            result = p.readUnsignedByte();
        }
    }
}