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
     * 公会积分排行(7:52)
     */
    public class UnionScoreRankResponse implements IResponse
    {
        /**
         * 数量
         */
        public var num:uint;

        /**
         * 排行信息
         */
        public var infoList:Array /* of ScoreRankInfo */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var scoreRankInfo:ScoreRankInfo = new ScoreRankInfo();
                scoreRankInfo.pos = p.readUnsignedShort();
                scoreRankInfo.id = p.readUnsignedInt();
                scoreRankInfo.name = p.readMultiByte(33, "utf-8");
                scoreRankInfo.score = p.readUnsignedInt();
                infoList.push(scoreRankInfo);
            }
        }
    }
}