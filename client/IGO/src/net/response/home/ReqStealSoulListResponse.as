/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.home
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 查询偷取过的好友列表(15:46)
     */
    public class ReqStealSoulListResponse implements IResponse
    {
        /**
         * 数量
         */
        public var num:uint;

        /**
         * 玩家ID
         */
        public var infoList:Array /* of Uint32_t */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var uint32_t:Uint32_t = new Uint32_t();
                uint32_t.id = p.readUnsignedInt();
                infoList.push(uint32_t);
            }
        }
    }
}