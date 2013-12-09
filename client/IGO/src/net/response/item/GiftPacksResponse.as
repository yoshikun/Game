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
     * 礼包列表(11:44)
     */
    public class GiftPacksResponse implements IResponse
    {
        /**
         *  礼包个数
         */
        public var num:uint;

        /**
         * 礼包信息
         */
        public var infoList:Array /* of GiftPackInfo */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var giftPackInfo:GiftPackInfo = new GiftPackInfo();
                giftPackInfo.id = p.readUnsignedInt();
                giftPackInfo.name = p.readMultiByte(33, "utf-8");
                giftPackInfo.itemType = p.readUnsignedByte();
                giftPackInfo.endTime = p.readUnsignedInt();
                giftPackInfo.num = p.readUnsignedShort();
				giftPackInfo.infoList = [];
                for(var j:int = 0; j < giftPackInfo.num; j++){
                	var infoItemNumInfo:ItemNumInfo = new ItemNumInfo();
                	infoItemNumInfo.id = p.readUnsignedInt();
                	infoItemNumInfo.num = p.readUnsignedInt();
                	giftPackInfo.infoList.push(infoItemNumInfo)
      	       }
                infoList.push(giftPackInfo);
            }
        }
    }
}