/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 查询角色基本信息(2:9)
     */
    public class ReqUserInfoRequest implements IRequest
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
            return 9;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(userID);
        }
    }
}