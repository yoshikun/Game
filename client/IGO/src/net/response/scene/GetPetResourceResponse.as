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
     * 拾取资源塔资源(5:64)
     */
    public class GetPetResourceResponse implements IResponse
    {
        /**
         * 1成功 2资源不存在
         */
        public var ret:uint;

        /**
         * 拾取资源的ID
         */
        public var guid:GUID;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            guid = new GUID();
            guid.id = p.readUnsignedInt();
            guid.type = p.readUnsignedByte();
        }
    }
}