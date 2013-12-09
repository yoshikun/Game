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
     * 请求我的排行榜排行(4:37)
     */
    public class ReqMyRankingResponse implements IResponse
    {
        /**
         * 排行榜类型 0等级 1财富 2战斗力
         */
        public var type:uint;

        /**
         * 排名 0未进榜
         */
        public var curPostion:uint;

        public function read(p:Packet):void
        {

            type = p.readUnsignedByte();
            curPostion = p.readUnsignedShort();
        }
    }
}