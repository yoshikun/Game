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
     * 育魂珠信息(15:20)
     */
    public class TrainSoulListResponse implements IResponse
    {
        /**
         * 所属用户ID
         */
        public var userID:uint;

        /**
         * 数量
         */
        public var num:uint;

        /**
         * 信息
         */
        public var infoList:Array /* of TrainSoul */;

        public function read(p:Packet):void
        {

            userID = p.readUnsignedInt();
            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var trainSoul:TrainSoul = new TrainSoul();
                trainSoul.id = p.readUnsignedShort();
                trainSoul.state = p.readUnsignedByte();
                trainSoul.type = p.readUnsignedByte();
                trainSoul.trainItem = p.readUnsignedInt();
                trainSoul.startTime = p.readUnsignedInt();
                trainSoul.endTime = p.readUnsignedInt();
                trainSoul.soulPoint = p.readUnsignedInt();
                infoList.push(trainSoul);
            }
        }
    }
}