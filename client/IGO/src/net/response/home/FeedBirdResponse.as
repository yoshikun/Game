/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.home
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 喂食琉璃鸟(15:32)
     */
    public class FeedBirdResponse implements IResponse
    {
        /**
         * 0成功 1时间限制 2免费次数不足 3花钱次数不足 4非法操作
         */
        public var ret:uint;

        /**
         * 喂食类型 1普通 2高级
         */
        public var type:uint;

        /**
         * buff数量
         */
        public var buff:uint;

        /**
         * 时间
         */
        public var time:uint;

        /**
         * 增加金钱
         */
        public var gold:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            type = p.readUnsignedByte();
            buff = p.readUnsignedShort();
            time = p.readUnsignedInt();
            gold = p.readUnsignedInt();
        }
    }
}