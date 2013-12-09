/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.dare
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 限时活动参与结果(13:26)
     */
    public class EnterDareResultResponse implements IResponse
    {
        /**
         * 类型 1角斗场 2多人副本 3公会boss 4公会站
         */
        public var type:uint;

        /**
         * 和CREATE_RROM一样
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            type = p.readUnsignedByte();
            ret = p.readUnsignedByte();
        }
    }
}