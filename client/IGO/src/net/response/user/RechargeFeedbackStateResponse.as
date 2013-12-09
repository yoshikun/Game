/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.user
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 请求充值回馈活动状态信息(2:118)
     */
    public class RechargeFeedbackStateResponse implements IResponse
    {
        /**
         * 充值金额
         */
        public var money:uint;

        /**
         * 数量
         */
        public var num:uint;

        /**
         * 活动状态 0不可领取 1可领取 2已领取
         */
        public var infoList:Array /* of ActiveStateInfo */;

        public function read(p:Packet):void
        {

            money = p.readUnsignedInt();
            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var activeStateInfo:ActiveStateInfo = new ActiveStateInfo();
                activeStateInfo.id = p.readUnsignedInt();
                activeStateInfo.state = p.readUnsignedByte();
                infoList.push(activeStateInfo);
            }
        }
    }
}