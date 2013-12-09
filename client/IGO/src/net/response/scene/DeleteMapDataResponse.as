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
     * 移除人物（宠物）(5:12)
     */
    public class DeleteMapDataResponse implements IResponse
    {
        /**
         * 唯一ID
         */
        public var guid:GUID;

        public function read(p:Packet):void
        {

            guid = new GUID();
            guid.id = p.readUnsignedInt();
            guid.type = p.readUnsignedByte();
        }
    }
}