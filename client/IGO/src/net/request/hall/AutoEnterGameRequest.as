/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.hall
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 自动进入游戏(4:34)
     */
    public class AutoEnterGameRequest implements IRequest
    {
        /**
         * 场景ID
         */
        public var id:uint;
    
        public function get module():uint
        {
            return 4;
        }

        public function get action():uint
        {
            return 34;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
        }
    }
}