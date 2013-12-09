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
     * 关系状态变更通知(10:4)
     */
    public class UpdateRelationStateResponse implements IResponse
    {
        /**
         * 关系人ID
         */
        public var userID:uint;

        /**
         * 昵称
         */
        public var nickName:String;

        /**
         * 关系类型 1好友 2黑名单
         */
        public var relationType:uint;

        /**
         * 友好度
         */
        public var degree:uint;

        /**
         * 等级
         */
        public var level:uint;

        /**
         * 状态 1在线 0离线
         */
        public var state:uint;

        /**
         * 变更类型 0不变 2添加 3删除 4类型改变 
         */
        public var updateType:uint;

        /**
         * 公会名称
         */
        public var unionName:String;

        /**
         * 性别
         */
        public var sex:uint;

        /**
         * 是否祝福过，0未祝福 1已祝福
         */
        public var homeBless:uint;

        public function read(p:Packet):void
        {

            userID = p.readUnsignedInt();
            nickName = p.readMultiByte(33, "utf-8");
            relationType = p.readUnsignedByte();
            degree = p.readUnsignedShort();
            level = p.readUnsignedShort();
            state = p.readUnsignedByte();
            updateType = p.readUnsignedByte();
            unionName = p.readMultiByte(33, "utf-8");
            sex = p.readUnsignedByte();
            homeBless = p.readUnsignedByte();
        }
    }
}