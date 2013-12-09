/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.hall
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 修改房间中的角色信息(4:14)
     */
    public class UpdateRoleResponse implements IResponse
    {
        /**
         * 结果 1成功
         */
        public var result:uint;

        public function read(p:Packet):void
        {

            result = p.readUnsignedByte();
        }
    }
}