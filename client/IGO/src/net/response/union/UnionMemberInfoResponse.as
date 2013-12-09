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
     * 请求公会成员信息返回(7:6)
     */
    public class UnionMemberInfoResponse implements IResponse
    {
        /**
         * 0增加 1删除
         */
        public var type:uint;

        /**
         * 公会ID
         */
        public var unionID:uint;

        /**
         * 公会成员数量
         */
        public var num:uint;

        /**
         * 公会成员个人信息
         */
        public var infoList:Array /* of UnionMemberInfo */;

        public function read(p:Packet):void
        {

            type = p.readUnsignedByte();
            unionID = p.readUnsignedInt();
            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var unionMemberInfo:UnionMemberInfo = new UnionMemberInfo();
                unionMemberInfo.unionID = p.readUnsignedInt();
                unionMemberInfo.userID = p.readUnsignedInt();
                unionMemberInfo.nickName = p.readMultiByte(33, "utf-8");
                unionMemberInfo.aliasName = p.readMultiByte(33, "utf-8");
                unionMemberInfo.sex = p.readUnsignedByte();
                unionMemberInfo.level = p.readUnsignedShort();
                unionMemberInfo.power = p.readUnsignedShort();
                unionMemberInfo.joinTime = p.readUnsignedInt();
                unionMemberInfo.lastupdate = p.readUnsignedInt();
                unionMemberInfo.donate = p.readUnsignedInt();
                unionMemberInfo.allDonate = p.readUnsignedInt();
                unionMemberInfo.score = p.readUnsignedInt();
                unionMemberInfo.state = p.readUnsignedByte();
                unionMemberInfo.combat = p.readUnsignedInt();
                unionMemberInfo.online = p.readUnsignedByte();
                unionMemberInfo.baselimit = p.readUnsignedByte();
                infoList.push(unionMemberInfo);
            }
        }
    }
}