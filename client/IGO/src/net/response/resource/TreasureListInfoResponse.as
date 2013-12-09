/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.resource
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 请求宝藏列表(14:2)
     */
    public class TreasureListInfoResponse implements IResponse
    {
        /**
         * 下次刷新时间
         */
        public var refTime:uint;

        /**
         * 宝藏ID列表
         */
        public var idList:Array /* of uint */;

        public function read(p:Packet):void
        {

            refTime = p.readUnsignedInt();
			idList = [];
            for(var i:int = 0; i < 9; i++){
                idList.push(p.readUnsignedInt());
            }
        }
    }
}