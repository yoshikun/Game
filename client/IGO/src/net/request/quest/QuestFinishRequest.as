/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.quest
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 结束任务(12:10)
     */
    public class QuestFinishRequest implements IRequest
    {
        /**
         * 任务ID
         */
        public var id:uint;
    
        public function get module():int
        {
            return 12;
        }

        public function get action():int
        {
            return 10;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
        }
    }
}