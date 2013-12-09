/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.user
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 删除角色返回(2:8)
     */
    public class RemoveRoleResponse implements IResponse
    {
        /**
         * 结果 1ok
         */
        public var ret:uint;

        /**
         * 角色ID
         */
        public var userID:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            userID = p.readUnsignedInt();
        }
    }
}