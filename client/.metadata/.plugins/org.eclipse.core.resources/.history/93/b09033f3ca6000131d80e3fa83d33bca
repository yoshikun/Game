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
     * 位置改变(5:66)
     */
    public class BackOffStateResponse implements IResponse
    {
        /**
         * 唯一ID
         */
        public var guid:GUID;

        /**
         * 倒退毫秒数
         */
        public var backTime:uint;

        /**
         * 状态
         */
        public var state:uint;

        /**
         * 像素坐标
         */
        public var x:uint;

        /**
         * 像素坐标
         */
        public var y:uint;

        public function read(p:Packet):void
        {

            guid = new GUID();
            guid.id = p.readUnsignedInt();
            guid.type = p.readUnsignedByte();
            backTime = p.readUnsignedInt();
            state = p.readUnsignedShort();
            x = p.readUnsignedShort();
            y = p.readUnsignedShort();
        }
    }
}