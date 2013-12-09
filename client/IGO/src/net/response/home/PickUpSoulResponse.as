/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.home
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 拾取魂精返回(15:28)
     */
    public class PickUpSoulResponse implements IResponse
    {
        /**
         * 0成功 1ID未发现
         */
        public var ret:uint;

        /**
         * ID
         */
        public var id:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            id = p.readUnsignedShort();
        }
    }
}