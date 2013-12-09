/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.item
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 设置英雄的状态(11:56)
     */
    public class SetHeroStateResponse implements IResponse
    {
        /**
         * 结果 0成功 1英雄不存在 2状态不对 3出征列表已满 4位置已有英雄
         */
        public var ret:uint;

        /**
         * 英雄ID
         */
        public var id:uint;

        /**
         * 状态 1出征 2休息 3训练 4取消训练
         */
        public var state:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            id = p.readUnsignedInt();
            state = p.readUnsignedByte();
        }
    }
}