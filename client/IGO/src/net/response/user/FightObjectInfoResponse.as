/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.user
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 战斗道具信息(2:88)
     */
    public class FightObjectInfoResponse implements IResponse
    {
        /**
         * 用户ID
         */
        public var userID:uint;

        /**
         * 战斗道具
         */
        public var idList:Array /* of uint */;

        public function read(p:Packet):void
        {

            userID = p.readUnsignedInt();
			idList = [];
            for(var i:int = 0; i < 2; i++){
                idList.push(p.readUnsignedInt());
            }
        }
    }
}