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
     * 请求公会列表返回(7:2)
     */
    public class UnionListInfoResponse implements IResponse
    {
        /**
         * 0增加 1删除
         */
        public var type:uint;

        /**
         * 公会信息数量
         */
        public var num:uint;

        /**
         * 公会基本信息
         */
        public var infoList:Array /* of UnionBaseInfo */;

        public function read(p:Packet):void
        {

            type = p.readUnsignedByte();
            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var unionBaseInfo:UnionBaseInfo = new UnionBaseInfo();
                unionBaseInfo.unionID = p.readUnsignedInt();
                unionBaseInfo.unionName = p.readMultiByte(33, "utf-8");
                unionBaseInfo.level = p.readUnsignedShort();
                unionBaseInfo.leaderID = p.readUnsignedInt();
                unionBaseInfo.leaderName = p.readMultiByte(33, "utf-8");
                unionBaseInfo.curnum = p.readUnsignedShort();
                unionBaseInfo.maxnum = p.readUnsignedShort();
                unionBaseInfo.state = p.readUnsignedByte();
                unionBaseInfo.combat = p.readUnsignedInt();
                infoList.push(unionBaseInfo);
            }
        }
    }
}