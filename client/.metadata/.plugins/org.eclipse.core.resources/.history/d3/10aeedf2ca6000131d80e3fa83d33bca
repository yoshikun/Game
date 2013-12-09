/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 邀请游戏应答(2:31)
     */
    public class InviteGameResultRequest implements IRequest
    {
        /**
         * 0同意 1拒绝
         */
        public var result:uint;
    
        /**
         * 0副本邀请 1切磋邀请 2队伍邀请
         */
        public var kind:uint;
    
        /**
         * 邀请者ID
         */
        public var userID:uint;
    
        /**
         * 邀请者名称
         */
        public var name:String;
    
        /**
         * 地图ID
         */
        public var mapID:uint;
    
        /**
         * 房间ID
         */
        public var roomID:uint;
    
        /**
         * 队伍ID
         */
        public var teamID:uint;
    
        public function get module():uint
        {
            return 2;
        }

        public function get action():uint
        {
            return 31;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(result);
            p.writeByte(kind);
            p.writeUnsignedInt(userID);
            p.writeMultiBytes(name, 33);
            p.writeUnsignedInt(mapID);
            p.writeUnsignedInt(roomID);
            p.writeUnsignedInt(teamID);
        }
    }
}