/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.user
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 赛跑选手列表(2:144)
     */
    public class NpcRaceListResponse implements IResponse
    {
        /**
         * 选手个数
         */
        public var num:uint;

        /**
         * 赛跑npc
         */
        public var infoList:Array /* of NpcRaceInfo */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var npcRaceInfo:NpcRaceInfo = new NpcRaceInfo();
                npcRaceInfo.id = p.readUnsignedInt();
                npcRaceInfo.odds = p.readUnsignedInt();
                npcRaceInfo.state = p.readUnsignedByte();
                npcRaceInfo.joinNum = p.readUnsignedInt();
                npcRaceInfo.winNum = p.readUnsignedInt();
                npcRaceInfo.gold = p.readUnsignedInt();
                infoList.push(npcRaceInfo);
            }
        }
    }
}