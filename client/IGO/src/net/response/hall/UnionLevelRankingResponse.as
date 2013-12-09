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
     * 请求公会等级排行榜(4:33)
     */
    public class UnionLevelRankingResponse implements IResponse
    {
        /**
         * 总数量
         */
        public var total:uint;

        /**
         * 数量
         */
        public var num:uint;

        /**
         * 公会排行信息
         */
        public var infoList:Array /* of UnionLvRankInfo */;

        public function read(p:Packet):void
        {

            total = p.readUnsignedShort();
            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var unionLvRankInfo:UnionLvRankInfo = new UnionLvRankInfo();
                unionLvRankInfo.unionID = p.readUnsignedInt();
                unionLvRankInfo.unionName = p.readMultiByte(33, "utf-8");
                unionLvRankInfo.leaderID = p.readUnsignedInt();
                unionLvRankInfo.leaderName = p.readMultiByte(33, "utf-8");
                unionLvRankInfo.level = p.readUnsignedShort();
                unionLvRankInfo.money = p.readUnsignedInt();
                unionLvRankInfo.curPostion = p.readUnsignedShort();
                unionLvRankInfo.lastPostion = p.readUnsignedShort();
                infoList.push(unionLvRankInfo);
            }
        }
    }
}