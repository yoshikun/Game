/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.item
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 整理背包(11:16)
     */
    public class PackupItemResponse implements IResponse
    {
        /**
         * 结果 1完成 2太频繁了
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
        }
    }
}