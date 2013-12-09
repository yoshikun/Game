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
     * 奖励礼包列表(2:132)
     */
    public class GiftPackRewardListResponse implements IResponse
    {
        /**
         * 类型 1初始化 2类型
         */
        public var actionType:uint;

        /**
         * 个数
         */
        public var num:uint;

        /**
         * 奖励信息
         */
        public var infoList:Array /* of GiftPackRewardInfo */;

        public function read(p:Packet):void
        {

            actionType = p.readUnsignedByte();
            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var giftPackRewardInfo:GiftPackRewardInfo = new GiftPackRewardInfo();
                giftPackRewardInfo.id = p.readUnsignedInt();
                giftPackRewardInfo.state = p.readUnsignedByte();
                giftPackRewardInfo.nextTime = p.readUnsignedInt();
                infoList.push(giftPackRewardInfo);
            }
        }
    }
}