/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 用户充值(2:49)
     */
    public class RecharegeMoneyParaRequest implements IRequest
    {
        /**
         * 充值金额
         */
        public var num:uint;
    
        public function get module():int
        {
            return 2;
        }

        public function get action():int
        {
            return 49;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(num);
        }
    }
}