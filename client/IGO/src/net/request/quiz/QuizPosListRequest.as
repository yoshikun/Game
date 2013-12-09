/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.quiz
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 竞赛结果(17:5)
     */
    public class QuizPosListRequest implements IRequest
    {
        public function get module():int
        {
            return 17;
        }

        public function get action():int
        {
            return 5;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}