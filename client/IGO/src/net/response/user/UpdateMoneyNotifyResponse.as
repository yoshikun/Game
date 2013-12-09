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
     * 金钱变更通知(2:22)
     */
    public class UpdateMoneyNotifyResponse implements IResponse
    {
        /**
         * 钱
         */
        public var money:uint;

        /**
         * 金币
         */
        public var gold:uint;

        /**
         * 礼券
         */
        public var ticket:uint;

        /**
         * 魂精
         */
        public var soulPoint:uint;

        /**
         * 噬魂能量
         */
        public var soulEnergy:uint;

        /**
         * 精力点
         */
        public var vigour:uint;

        /**
         * 声望
         */
        public var reputation:uint;

        public function read(p:Packet):void
        {

            money = p.readUnsignedInt();
            gold = p.readUnsignedInt();
            ticket = p.readUnsignedInt();
            soulPoint = p.readUnsignedInt();
            soulEnergy = p.readUnsignedInt();
            vigour = p.readUnsignedInt();
            reputation = p.readUnsignedInt();
        }
    }
}