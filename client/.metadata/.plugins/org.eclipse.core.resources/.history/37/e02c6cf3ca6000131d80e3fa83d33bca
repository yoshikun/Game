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
     * 复活(5:54)
     */
    public class ReliveMapDataResponse implements IResponse
    {
        /**
         * 结果 0成功 1复活道具不足 2复活失败 3取消复活
         */
        public var ret:uint;

        /**
         * 唯一ID
         */
        public var guid:GUID;

        /**
         * 当前生命值
         */
        public var hp:uint;

        /**
         * 最大生命值
         */
        public var maxHP:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            guid = new GUID();
            guid.id = p.readUnsignedInt();
            guid.type = p.readUnsignedByte();
            hp = p.readUnsignedInt();
            maxHP = p.readUnsignedInt();
        }
    }
}