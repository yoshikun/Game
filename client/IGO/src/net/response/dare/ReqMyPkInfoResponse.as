/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.dare
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 查询我的竞技信息(13:4)
     */
    public class ReqMyPkInfoResponse implements IResponse
    {
        /**
         * 我的排名
         */
        public var rank:uint;

        /**
         * 下次战斗时间
         */
        public var nextPKTime:uint;

        /**
         * 今日剩余次数
         */
        public var lastTime:uint;

        /**
         * 连胜次数
         */
        public var lastWin:uint;

        /**
         * 声望
         */
        public var reputation:uint;

        /**
         * 今日已购买次数
         */
        public var buyPKCount:uint;

        public function read(p:Packet):void
        {

            rank = p.readUnsignedInt();
            nextPKTime = p.readUnsignedInt();
            lastTime = p.readUnsignedInt();
            lastWin = p.readUnsignedInt();
            reputation = p.readUnsignedInt();
            buyPKCount = p.readUnsignedInt();
        }
    }
}