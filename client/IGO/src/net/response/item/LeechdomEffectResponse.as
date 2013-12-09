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
     * 消耗品BUF(11:58)
     */
    public class LeechdomEffectResponse implements IResponse
    {
        /**
         * 物品动作类型 1初始化 2添加 3删除 4更新
         */
        public var actionType:uint;

        /**
         * 数量
         */
        public var num:uint;

        /**
         * 信息
         */
        public var infoList:Array /* of LeechdomInfo */;

        public function read(p:Packet):void
        {

            actionType = p.readUnsignedByte();
            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var leechdomInfo:LeechdomInfo = new LeechdomInfo();
                leechdomInfo.effect = p.readUnsignedByte();
                leechdomInfo.value = p.readUnsignedShort();
                leechdomInfo.num = p.readUnsignedShort();
                leechdomInfo.startTime = p.readUnsignedInt();
                leechdomInfo.dueTime = p.readUnsignedInt();
                infoList.push(leechdomInfo);
            }
        }
    }
}