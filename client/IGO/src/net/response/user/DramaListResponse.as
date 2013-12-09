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
     * 播放过的剧情列表(2:90)
     */
    public class DramaListResponse implements IResponse
    {
        /**
         * 数量
         */
        public var num:uint;

        /**
         * 剧情ID
         */
        public var idList:Array /* of uint */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			idList = [];
            for(var i:int = 0; i < num; i++){
                idList.push(p.readUnsignedInt());
            }
        }
    }
}