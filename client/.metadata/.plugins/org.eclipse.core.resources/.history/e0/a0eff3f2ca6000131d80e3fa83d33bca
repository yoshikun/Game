/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 查询其他角色信息(2:29)
     */
    public class ReqOtherUserInfoRequest implements IRequest
    {
        /**
         * 角色ID
         */
        public var userID:uint;
    
        public function get module():uint
        {
            return 2;
        }

        public function get action():uint
        {
            return 29;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(userID);
        }
    }
}