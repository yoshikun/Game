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
     * 游客登录到系统返回结果(1:6)
     */
    public class VisitorLoginResponse implements IResponse
    {
        /**
         * 游客用户唯一ID
         */
        public var userID:uint;

        /**
         * 结果 1成功,4版本错误 其它全为失败
         */
        public var result:uint;

        /**
         * 服务器版本
         */
        public var serverVersion:uint;

        public function read(p:Packet):void
        {

            userID = p.readUnsignedInt();
            result = p.readUnsignedByte();
            serverVersion = p.readUnsignedInt();
        }
    }
}