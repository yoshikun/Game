/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.union
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 改变公会成员权限(7:19)
     */
    public class ChangePowerRequest implements IRequest
    {
        /**
         * 被改变成员ID
         */
        public var userID:uint;
    
        /**
         * 更改后的权限 1普通会员权限 2长老权限 4会长权限
         */
        public var power:uint;
    
        public function get module():int
        {
            return 7;
        }

        public function get action():int
        {
            return 19;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(userID);
            p.writeShort(power);
        }
    }
}