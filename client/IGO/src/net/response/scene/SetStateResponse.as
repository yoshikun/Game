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
     * 设置状态(5:46)
     */
    public class SetStateResponse implements IResponse
    {
        /**
         * ID
         */
        public var guid:GUID;

        /**
         * 需要设置的状态
         */
        public var state:uint;

        public function read(p:Packet):void
        {

            guid = new GUID();
            guid.id = p.readUnsignedInt();
            guid.type = p.readUnsignedByte();
            state = p.readUnsignedShort();
        }
    }
}