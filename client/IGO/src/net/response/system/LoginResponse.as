/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.system
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 登录到登陆服返回结果(1:2)
     */
    public class LoginResponse implements IResponse
    {
        /**
         * 结果 1成功,2找不到会话服务器 3网关用户满 4用户登录错误
         */
        public var result:uint;

        /**
         * 服务器版本
         */
        public var serverVersion:uint;

        /**
         * 用户账号
         */
        public var accid:uint;

        /**
         * 用户登录用key
         */
        public var key:uint;

        /**
         * 网关ip
         */
        public var ip:String;

        /**
         * 网关端口
         */
        public var port:uint;

        public function read(p:Packet):void
        {

            result = p.readUnsignedByte();
            serverVersion = p.readUnsignedInt();
            accid = p.readUnsignedInt();
            key = p.readUnsignedInt();
            ip = p.readMultiByte(32, "utf-8");
            port = p.readUnsignedShort();
        }
    }
}