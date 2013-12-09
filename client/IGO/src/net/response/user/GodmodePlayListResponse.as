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
     * 查询已挑战副本返回(2:46)
     */
    public class GodmodePlayListResponse implements IResponse
    {
        /**
         * 剩余有效刷新次数
         */
        public var count:uint;

        /**
         * 付费刷新次数
         */
        public var refresh:uint;

        /**
         * 已挑战副本数量
         */
        public var num:uint;

        /**
         * 已挑战副本信息
         */
        public var idList:Array /* of uint */;

        public function read(p:Packet):void
        {

            count = p.readUnsignedShort();
            refresh = p.readUnsignedShort();
            num = p.readUnsignedShort();
			idList = [];
            for(var i:int = 0; i < num; i++){
                idList.push(p.readUnsignedInt());
            }
        }
    }
}