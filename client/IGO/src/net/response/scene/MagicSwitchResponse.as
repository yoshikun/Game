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
     * 技能开启（切换）(5:40)
     */
    public class MagicSwitchResponse implements IResponse
    {
        /**
         * 0关闭 1开启
         */
        public var ret:uint;

        /**
         * 攻击编号
         */
        public var guid:GUID;

        /**
         * 技能id
         */
        public var skillID:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            guid = new GUID();
            guid.id = p.readUnsignedInt();
            guid.type = p.readUnsignedByte();
            skillID = p.readUnsignedShort();
        }
    }
}