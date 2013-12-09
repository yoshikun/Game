/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.scene
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 离开地图(5:6)
     */
    public class LeaveMapResponse implements IResponse
    {
        /**
         * 结果 1ok
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
        }
    }
}