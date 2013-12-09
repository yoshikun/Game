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
     * 声望消费列表(11:62)
     */
    public class ReqReputationListResponse implements IResponse
    {
        /**
         * 数量
         */
        public var num:uint;

        /**
         * 信息
         */
        public var infoList:Array /* of ReputationItem */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var reputationItem:ReputationItem = new ReputationItem();
                reputationItem.baseID = p.readUnsignedInt();
                reputationItem.state = p.readUnsignedByte();
                infoList.push(reputationItem);
            }
        }
    }
}