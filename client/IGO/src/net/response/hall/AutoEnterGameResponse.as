/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.hall
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 自动进入游戏(4:35)
     */
    public class AutoEnterGameResponse implements IResponse
    {
        /**
         * 用户ID
         */
        public var id:uint;

        /**
         * 结果 0.OK 1.未配置完全 2.没有可用英雄 3.没有配置任何英雄 4缺少道具 5.未知错误
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            id = p.readUnsignedInt();
            ret = p.readUnsignedByte();
        }
    }
}