/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.home
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 育魂珠产出返回(15:24)
     */
    public class TrainSoulProductResponse implements IResponse
    {
        /**
         * 0成功 1未发现
         */
        public var ret:uint;

        /**
         * 信息
         */
        public var info:TrainSoul;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            info = new TrainSoul();
            info.id = p.readUnsignedShort();
            info.state = p.readUnsignedByte();
            info.type = p.readUnsignedByte();
            info.trainItem = p.readUnsignedInt();
            info.startTime = p.readUnsignedInt();
            info.endTime = p.readUnsignedInt();
            info.soulPoint = p.readUnsignedInt();
        }
    }
}