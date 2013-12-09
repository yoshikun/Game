/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.item
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 更新道具数据(11:4)
     */
    public class UpdateItemResponse implements IResponse
    {
        /**
         * 物品动作类型 1初始化 2移动 3获得 4丢弃 5刷新
         */
        public var actionType:uint;

        /**
         * 数量
         */
        public var num:uint;

        /**
         * 简单物品信息
         */
        public var infoList:Array /* of SimpleItemInfo */;

        public function read(p:Packet):void
        {

            actionType = p.readUnsignedByte();
            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var simpleItemInfo:SimpleItemInfo = new SimpleItemInfo();
                simpleItemInfo.id = p.readUnsignedInt();
                simpleItemInfo.baseID = p.readUnsignedInt();
                simpleItemInfo.pos = new ItemLocationInfo();
                simpleItemInfo.pos.locationType = p.readUnsignedInt();
                simpleItemInfo.pos.tableID = p.readUnsignedInt();
                simpleItemInfo.pos.column = p.readUnsignedShort();
                simpleItemInfo.pos.row = p.readUnsignedShort();
                simpleItemInfo.num = p.readUnsignedInt();
                infoList.push(simpleItemInfo);
            }
        }
    }
}