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
     * 用户技能收集奖励领取信息(2:80)
     */
    public class UserCollectRewardInfoResponse implements IResponse
    {
        /**
         * 0技能图鉴 1英雄图鉴
         */
        public var type:uint;

        /**
         * 区域ID
         */
        public var zone:uint;

        /**
         * 0不可领取 1可领取 2已领取
         */
        public var state:uint;

        /**
         * 组收集结果
         */
        public var num:uint;

        /**
         * 组收集结果
         */
        public var idList:Array /* of uint */;

        public function read(p:Packet):void
        {

            type = p.readUnsignedByte();
            zone = p.readUnsignedInt();
            state = p.readUnsignedByte();
            num = p.readUnsignedShort();
			idList = [];
            for(var i:int = 0; i < num; i++){
                idList.push(p.readUnsignedByte());
            }
        }
    }
}