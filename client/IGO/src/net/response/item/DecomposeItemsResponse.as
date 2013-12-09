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
     * 分解获得道具(11:72)
     */
    public class DecomposeItemsResponse implements IResponse
    {
        /**
         * 物品数量
         */
        public var num:uint;

        /**
         * 物品数据
         */
        public var infoList:Array /* of ItemNumInfo */;

        public function read(p:Packet):void
        {

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