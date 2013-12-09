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
     * 设置生命及能量(5:50)
     */
    public class SetHpResponse implements IResponse
    {
        /**
         * 唯一ID
         */
        public var guid:GUID;

        /**
         * 当前血量
         */
        public var hp:uint;

        /**
         * 当前愤怒
         */
        public var sp:uint;

        /**
         * 当前能量
         */
        public var energy:uint;

        /**
         * 当前经验
         */
        public var exp:uint;

        public function read(p:Packet):void
        {

            guid = new GUID();
            guid.id = p.readUnsignedInt();
            guid.type = p.readUnsignedByte();
            hp = p.readUnsignedInt();
            sp = p.readUnsignedShort();
            energy = p.readUnsignedShort();
            exp = p.readUnsignedShort();
        }
    }
}