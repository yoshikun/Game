/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.scene
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 死亡通知(5:52)
     */
    public class DeathNotifyResponse implements IResponse
    {
        /**
         * 唯一ID
         */
        public var guid:GUID;

        /**
         * 复活等待时间（秒）0为无法复活
         */
        public var reliveWaitTime:uint;

        public function read(p:Packet):void
        {

            guid = new GUID();
            guid.id = p.readUnsignedInt();
            guid.type = p.readUnsignedByte();
            reliveWaitTime = p.readUnsignedInt();
        }
    }
}