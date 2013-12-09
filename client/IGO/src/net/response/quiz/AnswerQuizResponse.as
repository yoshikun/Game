/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.quiz
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 回答问题(17:4)
     */
    public class AnswerQuizResponse implements IResponse
    {
        /**
         * 题目序号
         */
        public var id:uint;

        /**
         * 结果 0过时 1正确 2错误
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            id = p.readUnsignedInt();
            ret = p.readUnsignedByte();
        }
    }
}