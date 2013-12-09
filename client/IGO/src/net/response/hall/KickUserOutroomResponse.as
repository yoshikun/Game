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
     * 房主踢某人离开(4:12)
     */
    public class KickUserOutroomResponse implements IResponse
    {
        /**
         * 结果 1成功,2不在房间里
         */
        public var result:uint;

        /**
         * 离开房间的用户
         */
        public var userID:uint;

        public function read(p:Packet):void
        {

            result = p.readUnsignedByte();
            userID = p.readUnsignedInt();
        }
    }
}