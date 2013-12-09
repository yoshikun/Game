/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.user
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 用户技能收集奖励领取(2:66)
     */
    public class UserCollectRewardResponse implements IResponse
    {
        /**
         * 领取结果返回 0成功 1未到进度 2已领取 3不存在的组信息 4未知错误
         */
        public var ret:uint;

        /**
         * 领取奖励类型 1进度奖励 2组收集奖励 3英雄奖励
         */
        public var type:uint;

        /**
         * 组奖励对应组ID 英雄奖励对应英雄个数 进度奖励发0
         */
        public var value:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            type = p.readUnsignedByte();
            value = p.readUnsignedShort();
        }
    }
}