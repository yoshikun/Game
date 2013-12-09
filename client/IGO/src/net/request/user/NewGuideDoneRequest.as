/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 新手引导完成(2:55)
     */
    public class NewGuideDoneRequest implements IRequest
    {
        /**
         * 引导ID
         */
        public var guide:uint;
    
        /**
         * 步骤ID(只有step是0时才算完成)
         */
        public var step:uint;
    
        public function get module():int
        {
            return 2;
        }

        public function get action():int
        {
            return 55;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(guide);
            p.writeShort(step);
        }
    }
}