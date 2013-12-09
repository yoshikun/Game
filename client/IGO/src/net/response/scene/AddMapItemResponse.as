/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.scene
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 物品掉落(5:78)
     */
    public class AddMapItemResponse implements IResponse
    {
        /**
         * 物品数量
         */
        public var num:uint;

        /**
         * 掉落道具
         */
        public var infoList:Array /* of MapItemData */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var mapItemData:MapItemData = new MapItemData();
                mapItemData.type = p.readUnsignedByte();
                mapItemData.id = p.readUnsignedInt();
                mapItemData.baseID = p.readUnsignedInt();
                mapItemData.npcX = p.readUnsignedInt();
                mapItemData.npcY = p.readUnsignedInt();
                mapItemData.x = p.readUnsignedInt();
                mapItemData.y = p.readUnsignedInt();
                mapItemData.num = p.readUnsignedInt();
                mapItemData.npcID = p.readUnsignedInt();
                infoList.push(mapItemData);
            }
        }
    }
}