/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.quest
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 通知访问类任务完成情况(12:13)
     */
    public class NotifyQuestInfoRequest implements IRequest
    {
        /**
         * npcID
         */
        public var id:uint;
    
        public function get module():uint
        {
            return 12;
        }

        public function get action():uint
        {
            return 13;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
        }
    }
}