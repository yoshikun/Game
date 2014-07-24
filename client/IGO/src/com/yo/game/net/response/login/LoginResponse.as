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
     * 登录到登陆服返回结果 一般返回的都是错误信息(1:2)
     */
    public class LoginResponse implements IResponse
    {
        /**
         * 结果 1维护 2未到开服时间 3网关未开
         */
        public var result:uint;

        public function read(p:Packet):void
        {

            result = p.readUnsignedInt();
        }
    }
}