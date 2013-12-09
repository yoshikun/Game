/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.quiz
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 回答问题(17:3)
     */
    public class AnswerQuizRequest implements IRequest
    {
        /**
         * 题目序号
         */
        public var id:uint;
    
        /**
         * 竞赛类型 1世界 2个人
         */
        public var type:uint;
    
        /**
         * 答案1,2,3,4
         */
        public var answerID:uint;
    
        public function get module():int
        {
            return 17;
        }

        public function get action():int
        {
            return 3;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
            p.writeByte(type);
            p.writeUnsignedInt(answerID);
        }
    }
}