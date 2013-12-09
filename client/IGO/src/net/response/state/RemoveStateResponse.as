/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.state
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 请求删除状态返回(8:6)
     */
    public class RemoveStateResponse implements IResponse
    {
        /**
         * 用户ID
         */
        public var userID:uint;

        /**
         * 状态id
         */
        public var stateID:uint;

        public function read(p:Packet):void
        {

            userID = p.readUnsignedInt();
            stateID = p.readUnsignedInt();
        }
    }
}