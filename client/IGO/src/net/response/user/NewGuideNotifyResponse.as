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
     * 新手引导开启通知(2:54)
     */
    public class NewGuideNotifyResponse implements IResponse
    {
        /**
         * 引导ID
         */
        public var guide:uint;

        /**
         * 步骤ID
         */
        public var step:uint;

        public function read(p:Packet):void
        {

            guide = p.readUnsignedInt();
            step = p.readUnsignedShort();
        }
    }
}