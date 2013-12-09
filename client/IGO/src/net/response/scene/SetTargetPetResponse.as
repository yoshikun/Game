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
     * 强制宠物攻击目标(5:70)
     */
    public class SetTargetPetResponse implements IResponse
    {
        /**
         * 0 设置成功
         */
        public var ret:uint;

        /**
         * 功方临时ID
         */
        public var guid:GUID;

        /**
         * 目标临时ID
         */
        public var targetID:GUID;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            guid = new GUID();
            guid.id = p.readUnsignedInt();
            guid.type = p.readUnsignedByte();
            targetID = new GUID();
            targetID.id = p.readUnsignedInt();
            targetID.type = p.readUnsignedByte();
        }
    }
}