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
     * 取消状态(5:48)
     */
    public class ClearStateResponse implements IResponse
    {
        /**
         * ID
         */
        public var guid:GUID;

        /**
         * 需要清除的状态
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