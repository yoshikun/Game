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
     * 资源塔产出资源(5:62)
     */
    public class ResourcePetProductResponse implements IResponse
    {
        /**
         * 资源塔ID
         */
        public var id:uint;

        /**
         * 产出资源量
         */
        public var res:uint;

        public function read(p:Packet):void
        {

            id = p.readUnsignedInt();
            res = p.readUnsignedShort();
        }
    }
}