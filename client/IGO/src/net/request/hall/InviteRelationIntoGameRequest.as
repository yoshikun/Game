/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.hall
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 邀请好友加入游戏(4:19)
     */
    public class InviteRelationIntoGameRequest implements IRequest
    {
        /**
         * 邀请类型 0好友 1公会成员
         */
        public var type:uint;
    
        /**
         * 邀请类型 0副本邀请 1切磋邀请 2队伍邀请
         */
        public var kind:uint;
    
        /**
         * 被邀请者名称
         */
        public var name:String;
    
        public function get module():int
        {
            return 4;
        }

        public function get action():int
        {
            return 19;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(type);
            p.writeByte(kind);
            p.writeMultiBytes(name, 33);
        }
    }
}