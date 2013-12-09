/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.relation
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 发送社会关系列表(10:2)
     */
    public class SendRelationListResponse implements IResponse
    {
        /**
         * 数量
         */
        public var num:uint;

        /**
         * 关系
         */
        public var infoList:Array /* of RelationInfo */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var relationInfo:RelationInfo = new RelationInfo();
                relationInfo.userID = p.readUnsignedInt();
                relationInfo.nickName = p.readMultiByte(33, "utf-8");
                relationInfo.relationType = p.readUnsignedByte();
                relationInfo.degree = p.readUnsignedShort();
                relationInfo.level = p.readUnsignedShort();
                relationInfo.state = p.readUnsignedByte();
                relationInfo.unionName = p.readMultiByte(33, "utf-8");
                relationInfo.sex = p.readUnsignedByte();
                relationInfo.homeBless = p.readUnsignedByte();
                infoList.push(relationInfo);
            }
        }
    }
}