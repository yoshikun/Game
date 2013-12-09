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
     * 查询背包容量(11:52)
     */
    public class MainPackSpaceResponse implements IResponse
    {
        /**
         * 背包容量
         */
        public var space:uint;

        public function read(p:Packet):void
        {

            space = p.readUnsignedInt();
        }
    }
}