/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.quest
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 接收任务(12:5)
     */
    public class AcceptQuestRequest implements IRequest
    {
        /**
         * 接收任务ID
         */
        public var id:uint;
    
        public function get module():int
        {
            return 12;
        }

        public function get action():int
        {
            return 5;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
        }
    }
}