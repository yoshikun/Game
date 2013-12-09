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
     * 英雄下场通知(5:56)
     */
    public class NpcLeaveNotifyResponse implements IResponse
    {
        /**
         * 被替换下场的英雄临时id
         */
        public var id:uint;

        /**
         * 被替换下场的英雄基本id
         */
        public var baseID:uint;

        /**
         * 替换英雄临时id
         */
        public var reid:uint;

        /**
         * 替换英雄基本id
         */
        public var rebaseID:uint;

        public function read(p:Packet):void
        {

            id = p.readUnsignedInt();
            baseID = p.readUnsignedInt();
            reid = p.readUnsignedInt();
            rebaseID = p.readUnsignedInt();
        }
    }
}