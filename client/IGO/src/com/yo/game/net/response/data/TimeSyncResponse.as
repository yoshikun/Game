/**
 * Copyright (c) 2012, www.yo.com All rights reserved.
 */
package com.yo.game.net.response.data
{
    import com.yo.framework.net.IResponse;
    import com.yo.game.net.vo.*;
    import com.yo.framework.net.Packet;

    /*@import*/

    /**
     * 时间同步(2:6)
     */
    public class TimeSyncResponse implements IResponse
    {
        /**
         * 同步时间
         */
        public var time:uint;

        public function read(p:Packet):void
        {

            time = p.readUnsignedInt();
        }
    }
}