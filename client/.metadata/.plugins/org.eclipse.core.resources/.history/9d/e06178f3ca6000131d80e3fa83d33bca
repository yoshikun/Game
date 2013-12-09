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
     * 请求公会详细信息返回(7:4)
     */
    public class UnionDetailInfoResponse implements IResponse
    {
        /**
         * 公会信息
         */
        public var info:UnionInfo;

        public function read(p:Packet):void
        {

            info = new UnionInfo();
            info.unionID = p.readUnsignedInt();
            info.unionName = p.readMultiByte(33, "utf-8");
            info.level = p.readUnsignedShort();
            info.createID = p.readUnsignedInt();
            info.createName = p.readMultiByte(33, "utf-8");
            info.leaderID = p.readUnsignedInt();
            info.leaderName = p.readMultiByte(33, "utf-8");
            info.curnum = p.readUnsignedShort();
            info.maxnum = p.readUnsignedShort();
            info.state = p.readUnsignedByte();
            info.createTime = p.readUnsignedInt();
            info.money = p.readUnsignedInt();
            info.score = p.readUnsignedInt();
            info.baseLevel = p.readUnsignedShort();
            info.baseExp = p.readUnsignedInt();
            info.note = p.readMultiByte(255, "utf-8");
            info.combat = p.readUnsignedInt();
        }
    }
}