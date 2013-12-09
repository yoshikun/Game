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
     * 请求用户等级排行榜返回(4:27)
     */
    public class UserLevelRankingResponse implements IResponse
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
         * 数量
         */
        public var infoList:Array /* of LevelRankInfo */;

        public function read(p:Packet):void
        {

            total = p.readUnsignedShort();
            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var levelRankInfo:LevelRankInfo = new LevelRankInfo();
                levelRankInfo.userID = p.readUnsignedInt();
                levelRankInfo.nickName = p.readMultiByte(33, "utf-8");
                levelRankInfo.level = p.readUnsignedShort();
                levelRankInfo.unionName = p.readMultiByte(33, "utf-8");
                levelRankInfo.curPostion = p.readUnsignedShort();
                levelRankInfo.lastPostion = p.readUnsignedShort();
                infoList.push(levelRankInfo);
            }
        }
    }
}