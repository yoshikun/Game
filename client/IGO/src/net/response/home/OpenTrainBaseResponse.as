/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.home
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 道具开启训练栏位(15:10)
     */
    public class OpenTrainBaseResponse implements IResponse
    {
        /**
         * 0成功 1道具不足 2非法 3金钱不足
         */
        public var ret:uint;

        /**
         * 栏位ID（1,2,3,4）
         */
        public var id:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            id = p.readUnsignedShort();
        }
    }
}