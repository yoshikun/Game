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
     * 登录成功返回登陆信息(1:4)
     */
    public class LoginSuccessResponse implements IResponse
    {
        /**
         * 用户id
         */
        public var accid:uint;

        /**
         * 用户分配的临时id 用于登陆网关的验证
         */
        public var loginTempID:uint;

        /**
         * 用户账号
         */
        public var account:String;

        /**
         * 分配给你的网关ip
         */
        public var gateIp:String;

        /**
         * 端口
         */
        public var port:uint;

        /**
         * 生成的key 用于网关的验证
         */
        public var desKey:String;

        public function read(p:Packet):void
        {

            accid = p.readUnsignedInt();
            loginTempID = p.readUnsignedInt();
            account = p.readMultiByte(32, "utf-8");
            gateIp = p.readMultiByte(16, "utf-8");
            port = p.readUnsignedShort();
            desKey = p.readMultiByte(32, "utf-8");
        }
    }
}