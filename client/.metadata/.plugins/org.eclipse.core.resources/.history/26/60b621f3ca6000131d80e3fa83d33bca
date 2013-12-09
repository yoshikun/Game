/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.home
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 偷取魂晶(15:44)
     */
    public class ReqStealSoulResponse implements IResponse
    {
        /**
         * 0成功 1今日已偷过 2次数上限 3非法
         */
        public var ret:uint;

        /**
         * 玩家ID
         */
        public var id:uint;

        /**
         * 魂晶数量
         */
        public var soul:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            id = p.readUnsignedInt();
            soul = p.readUnsignedInt();
        }
    }
}