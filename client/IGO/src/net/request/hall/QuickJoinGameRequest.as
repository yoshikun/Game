/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.hall
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 快速加入游戏(4:24)
     */
    public class QuickJoinGameRequest implements IRequest
    {
        /**
         * 副本ID 0 代表全部
         */
        public var id:uint;
    
        public function get module():int
        {
            return 4;
        }

        public function get action():int
        {
            return 24;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
        }
    }
}