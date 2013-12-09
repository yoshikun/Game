/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.home
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 加速训练进度(15:12)
     */
    public class SpeedUpTrainHeroResponse implements IResponse
    {
        /**
         * 0成功 1道具不足 2非法
         */
        public var ret:uint;

        /**
         * 栏位信息
         */
        public var info:TrainHeroBase;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            info = new TrainHeroBase();
            info.id = p.readUnsignedShort();
            info.state = p.readUnsignedByte();
            info.heroID = p.readUnsignedInt();
            info.startTime = p.readUnsignedInt();
            info.endTime = p.readUnsignedInt();
        }
    }
}