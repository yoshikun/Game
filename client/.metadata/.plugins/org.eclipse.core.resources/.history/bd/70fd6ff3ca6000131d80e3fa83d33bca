/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.scene
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 玩家道具信息列表(5:20)
     */
    public class UserObjectInfoResponse implements IResponse
    {
        /**
         * 道具信息
         */
        public var infoList:Array /* of UseItemInfo */;

        public function read(p:Packet):void
        {

			infoList = [];
            for(var i:int = 0; i < 2; i++){
                var useItemInfo:UseItemInfo = new UseItemInfo();
                useItemInfo.id = p.readUnsignedInt();
                useItemInfo.num = p.readUnsignedInt();
                useItemInfo.nextTime = p.readUnsignedInt();
                infoList.push(useItemInfo);
            }
        }
    }
}