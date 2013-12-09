/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.relation
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 邀请加好友(10:6)
     */
    public class RelationInteractionResponse implements IResponse
    {
        /**
         * 邀请结果 1成功加为好友 2邀请已发送，等待对方应答 3对方添加好友未开启 4对方拒绝 5对方已经在好友列表中 6不要加自己为好友 7你的好友列表已满 8对方的好友列表已满 9对方不在线
         */
        public var ret:uint;

        /**
         * 邀请人
         */
        public var userID:uint;

        /**
         * 邀请人昵称
         */
        public var name:String;

        /**
         * 被邀请人名称
         */
        public var relationName:String;

        /**
         * 状态 0邀请某人 1同意邀请 2拒绝邀请 
         */
        public var state:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            userID = p.readUnsignedInt();
            name = p.readMultiByte(33, "utf-8");
            relationName = p.readMultiByte(33, "utf-8");
            state = p.readUnsignedByte();
        }
    }
}