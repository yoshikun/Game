/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.home
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 进入家园(15:1)
     */
    public class EnterHomeRequest implements IRequest
    {
        /**
         * 家园ID，同玩家ID
         */
        public var id:uint;
    
        public function get module():int
        {
            return 15;
        }

        public function get action():int
        {
            return 1;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
        }
    }
}