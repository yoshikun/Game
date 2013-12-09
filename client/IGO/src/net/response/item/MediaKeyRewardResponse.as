/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.item
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 领取媒体激活码奖励(11:70)
     */
    public class MediaKeyRewardResponse implements IResponse
    {
        /**
         * 结果 0未知 1成功 2key过期 3重复key 4已领取 5未发现key 6背包空间不足
         */
        public var ret:uint;

        /**
         * 奖励道具数目
         */
        public var num:uint;

        /**
         * 道具 金钱和经验奖励都算道具
         */
        public var infoList:Array /* of ItemNumInfo */;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var itemNumInfo:ItemNumInfo = new ItemNumInfo();
                itemNumInfo.id = p.readUnsignedInt();
                itemNumInfo.num = p.readUnsignedInt();
                infoList.push(itemNumInfo);
            }
        }
    }
}