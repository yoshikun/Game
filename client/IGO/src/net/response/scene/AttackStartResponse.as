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
     * 攻击(5:38)
     */
    public class AttackStartResponse implements IResponse
    {
        /**
         * 结果 0ok 1禁止攻击
         */
        public var ret:uint;

        /**
         * 出击宠物ID
         */
        public var baseID:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            baseID = p.readUnsignedInt();
        }
    }
}