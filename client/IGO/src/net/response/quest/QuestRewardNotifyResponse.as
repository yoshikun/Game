/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.quest
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 任务奖励通知(12:12)
     */
    public class QuestRewardNotifyResponse implements IResponse
    {
        /**
         * 任务ID
         */
        public var id:uint;

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

            id = p.readUnsignedInt();
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