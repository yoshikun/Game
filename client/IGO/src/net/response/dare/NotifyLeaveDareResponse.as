/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.dare
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 通知离开限时活动(13:18)
     */
    public class NotifyLeaveDareResponse implements IResponse
    {
        /**
         * 类型 1角斗场 2多人副本 3公会BOSS
         */
        public var type:uint;

        public function read(p:Packet):void
        {

            type = p.readUnsignedByte();
        }
    }
}