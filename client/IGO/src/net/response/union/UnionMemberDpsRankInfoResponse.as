/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.union
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 公会成员伤害输出排行(7:48)
     */
    public class UnionMemberDpsRankInfoResponse implements IResponse
    {
        /**
         * 数量
         */
        public var num:uint;

        /**
         * 排行信息
         */
        public var infoList:Array /* of DpsRankInfo */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var dpsRankInfo:DpsRankInfo = new DpsRankInfo();
                dpsRankInfo.unionID = p.readUnsignedInt();
                dpsRankInfo.charID = p.readUnsignedInt();
                dpsRankInfo.name = p.readMultiByte(33, "utf-8");
                dpsRankInfo.rank = p.readUnsignedShort();
                dpsRankInfo.dps = p.readUnsignedInt();
                dpsRankInfo.day = p.readUnsignedInt();
                infoList.push(dpsRankInfo);
            }
        }
    }
}