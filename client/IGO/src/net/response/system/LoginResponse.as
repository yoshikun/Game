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
         * 结果 0成功,1维护 2未到开服时间 3网关未开
         */
        public var result:uint;

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
            ip = p.readMultiByte(32, "utf-8");
            port = p.readUnsignedShort();
        }
    }
}