/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.quest
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 获取已接任务列表(12:1)
     */
    public class GetQuestRequest implements IRequest
    {
        public function get module():int
        {
            return 12;
        }

        public function get action():int
        {
            return 1;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}