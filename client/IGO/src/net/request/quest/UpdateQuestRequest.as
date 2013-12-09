/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.quest
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 获取新任务列表(12:3)
     */
    public class UpdateQuestRequest implements IRequest
    {
        public function get module():uint
        {
            return 12;
        }

        public function get action():uint
        {
            return 3;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}