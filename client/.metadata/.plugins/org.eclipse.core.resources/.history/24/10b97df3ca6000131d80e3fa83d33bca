/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.user
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 配置战斗道具(2:82)
     */
    public class DeployFightObjectResponse implements IResponse
    {
        /**
         * 0添加 1移除
         */
        public var type:uint;

        /**
         * 0成功 1已存在 2失败
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            type = p.readUnsignedByte();
            ret = p.readUnsignedByte();
        }
    }
}