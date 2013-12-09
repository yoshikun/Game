/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.quest
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 放弃任务(12:7)
     */
    public class QuitQuestRequest implements IRequest
    {
        /**
         * 放弃任务ID
         */
        public var id:uint;
    
        public function get module():int
        {
            return 12;
        }

        public function get action():int
        {
            return 7;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
        }
    }
}