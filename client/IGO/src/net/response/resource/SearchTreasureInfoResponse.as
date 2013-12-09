/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.resource
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 探宝(14:4)
     */
    public class SearchTreasureInfoResponse implements IResponse
    {
        /**
         * 0成功 1资源不足 2未知错误
         */
        public var ret:uint;

        /**
         * 数量
         */
        public var num:uint;

        /**
         * 获得宝藏ID列表
         */
        public var idList:Array /* of uint */;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            num = p.readUnsignedShort();
			idList = [];
            for(var i:int = 0; i < num; i++){
                idList.push(p.readUnsignedInt());
            }
        }
    }
}