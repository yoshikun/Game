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
     * 使用物品返回(11:14)
     */
    public class UseItemResponse implements IResponse
    {
        /**
         * 结果 0成功 1超过目标数量 2冷却中 3物品重复(目前只针对英雄) 4物品不能使用 5人物等级不够 6背包空间不足 7使用物品错误
         */
        public var ret:uint;

        /**
         * 物品ID
         */
        public var itemID:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            itemID = p.readUnsignedInt();
        }
    }
}