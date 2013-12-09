/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.scene
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 变更传送门状态(5:72)
     */
    public class ChangeDoorStateResponse implements IResponse
    {
        /**
         * 传送门
         */
        public var info:DoorInfo;

        public function read(p:Packet):void
        {

            info = new DoorInfo();
            info.id = p.readUnsignedInt();
            info.state = p.readUnsignedByte();
        }
    }
}