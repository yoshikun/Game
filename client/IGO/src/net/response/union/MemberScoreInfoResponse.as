/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.union
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 公会成员积分信息(7:54)
     */
    public class MemberScoreInfoResponse implements IResponse
    {
        /**
         * 数量
         */
        public var num:uint;

        /**
         * 排行信息
         */
        public var infoList:Array /* of ScoreInfo */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var scoreInfo:ScoreInfo = new ScoreInfo();
                scoreInfo.id = p.readUnsignedInt();
                scoreInfo.name = p.readMultiByte(33, "utf-8");
                scoreInfo.score = p.readUnsignedInt();
                scoreInfo.rank = p.readUnsignedInt();
                infoList.push(scoreInfo);
            }
        }
    }
}