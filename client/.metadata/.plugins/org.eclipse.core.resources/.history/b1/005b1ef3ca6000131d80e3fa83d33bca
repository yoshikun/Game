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
     * 请求用户战斗力排行榜返回(4:31)
     */
    public class UserCombatRankingResponse implements IResponse
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
        public var infoList:Array /* of CombatRankInfo */;

        public function read(p:Packet):void
        {

            total = p.readUnsignedShort();
            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var combatRankInfo:CombatRankInfo = new CombatRankInfo();
                combatRankInfo.userID = p.readUnsignedInt();
                combatRankInfo.nickName = p.readMultiByte(33, "utf-8");
                combatRankInfo.combat = p.readUnsignedInt();
                combatRankInfo.unionName = p.readMultiByte(33, "utf-8");
                combatRankInfo.curPostion = p.readUnsignedShort();
                combatRankInfo.lastPostion = p.readUnsignedShort();
                infoList.push(combatRankInfo);
            }
        }
    }
}