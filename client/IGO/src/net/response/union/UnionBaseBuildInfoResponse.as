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
     * 公会基地修筑信息(7:44)
     */
    public class UnionBaseBuildInfoResponse implements IResponse
    {
        /**
         * 数量
         */
        public var num:uint;

        /**
         * 基地修筑信息
         */
        public var infoList:Array /* of BaseBuildInfo */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var baseBuildInfo:BaseBuildInfo = new BaseBuildInfo();
                baseBuildInfo.unionID = p.readUnsignedInt();
                baseBuildInfo.charID = p.readUnsignedInt();
                baseBuildInfo.name = p.readMultiByte(33, "utf-8");
                baseBuildInfo.type = p.readUnsignedByte();
                baseBuildInfo.money = p.readUnsignedInt();
                baseBuildInfo.addexp = p.readUnsignedInt();
                baseBuildInfo.addmoney = p.readUnsignedInt();
                baseBuildInfo.time = p.readUnsignedInt();
                baseBuildInfo.week = p.readUnsignedInt();
                infoList.push(baseBuildInfo);
            }
        }
    }
}