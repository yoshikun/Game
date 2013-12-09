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
     * 用户斗兽信息(2:112)
     */
    public class UserFightbossRewardResponse implements IResponse
    {
        /**
         * 铜质宝箱
         */
        public var copperItem:uint;

        /**
         * 银质宝箱
         */
        public var silverItem:uint;

        /**
         * 金质宝箱
         */
        public var goldItem:uint;

        /**
         * 钻石宝箱
         */
        public var diamondItem:uint;

        public function read(p:Packet):void
        {

            copperItem = p.readUnsignedInt();
            silverItem = p.readUnsignedInt();
            goldItem = p.readUnsignedInt();
            diamondItem = p.readUnsignedInt();
        }
    }
}