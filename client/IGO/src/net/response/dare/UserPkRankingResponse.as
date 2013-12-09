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
     * 竞技场排行(13:8)
     */
    public class UserPkRankingResponse implements IResponse
    {
        /**
         * 1竞技场 2角斗场
         */
        public var type:uint;

        /**
         * 数量
         */
        public var num:uint;

        /**
         * 排行信息
         */
        public var infoList:Array /* of PKRankInfo */;

        public function read(p:Packet):void
        {

            type = p.readUnsignedByte();
            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var pKRankInfo:PKRankInfo = new PKRankInfo();
                pKRankInfo.userID = p.readUnsignedInt();
                pKRankInfo.nickName = p.readMultiByte(33, "utf-8");
                pKRankInfo.value = p.readUnsignedInt();
                pKRankInfo.rank = p.readUnsignedShort();
                infoList.push(pKRankInfo);
            }
        }
    }
}