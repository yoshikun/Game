/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 请求领取充值回馈礼包信息(2:119)
     */
    public class ReqFeedbackGiftpackInfoRequest implements IRequest
    {
        /**
         * ID
         */
        public var id:uint;
    
        public function get module():int
        {
            return 2;
        }

        public function get action():int
        {
            return 119;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
        }
    }
}