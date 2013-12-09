/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.hall
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 请求用户财富排行榜返回(4:29)
     */
    public class UserWealthRankingResponse implements IResponse
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
        public var infoList:Array /* of WealthRankInfo */;

        public function read(p:Packet):void
        {

            total = p.readUnsignedShort();
            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var wealthRankInfo:WealthRankInfo = new WealthRankInfo();
                wealthRankInfo.userID = p.readUnsignedInt();
                wealthRankInfo.nickName = p.readMultiByte(33, "utf-8");
                wealthRankInfo.money = p.readUnsignedInt();
                wealthRankInfo.unionName = p.readMultiByte(33, "utf-8");
                wealthRankInfo.curPostion = p.readUnsignedShort();
                wealthRankInfo.lastPostion = p.readUnsignedShort();
                infoList.push(wealthRankInfo);
            }
        }
    }
}