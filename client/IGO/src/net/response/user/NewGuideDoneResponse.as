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
     * 新手引导完成(2:56)
     */
    public class NewGuideDoneResponse implements IResponse
    {
        /**
         * 0成功 1失败
         */
        public var ret:uint;

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

            ret = p.readUnsignedByte();
            guide = p.readUnsignedInt();
            step = p.readUnsignedShort();
        }
    }
}