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
     * 瞬移(5:84)
     */
    public class GotoResponse implements IResponse
    {
        /**
         * ID
         */
        public var guid:GUID;

        /**
         * 方向
         */
        public var direct:uint;

        /**
         * 目标点
         */
        public var destX:uint;

        /**
         * 目标点
         */
        public var destY:uint;

        public function read(p:Packet):void
        {

            guid = new GUID();
            guid.id = p.readUnsignedInt();
            guid.type = p.readUnsignedByte();
            direct = p.readUnsignedByte();
            destX = p.readUnsignedShort();
            destY = p.readUnsignedShort();
        }
    }
}