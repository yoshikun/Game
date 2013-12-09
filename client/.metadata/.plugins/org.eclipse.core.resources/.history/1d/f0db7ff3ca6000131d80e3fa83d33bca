/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.user
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 神之封印属性加成信息(2:70)
     */
    public class GodSealInfoResponse implements IResponse
    {
        /**
         * 当前已解除点的序号
         */
        public var dot:uint;

        /**
         * 
         */
        public var data:AddProperity;

        public function read(p:Packet):void
        {

            dot = p.readUnsignedShort();
            data = new AddProperity();
            data.atk = p.readUnsignedShort();
            data.atkp = p.readUnsignedShort();
            data.crip = p.readUnsignedShort();
            data.cri = p.readUnsignedShort();
            data.def = p.readUnsignedShort();
            data.ref = p.readUnsignedShort();
            data.tough = p.readUnsignedShort();
            data.hp = p.readUnsignedShort();
            data.hpp = p.readUnsignedShort();
            data.suck = p.readUnsignedShort();
            data.rhp = p.readUnsignedShort();
        }
    }
}