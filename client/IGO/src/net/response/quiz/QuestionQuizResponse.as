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
     * 竞赛问答题内容(17:2)
     */
    public class QuestionQuizResponse implements IResponse
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
         * 剩余答题时间(秒)
         */
        public var spareTime:uint;

        /**
         * 题目标题
         */
        public var subject:TextInfo;

        /**
         * 答案1,2,3,4
         */
        public var answerList:Array /* of TextInfo */;

        public function read(p:Packet):void
        {

            id = p.readUnsignedInt();
            type = p.readUnsignedByte();
            spareTime = p.readUnsignedByte();
            subject = new TextInfo();
            subject.text = p.readUTF();
			answerList = [];
            for(var i:int = 0; i < 4; i++){
                var textInfo:TextInfo = new TextInfo();
                textInfo.text = p.readUTF();
                answerList.push(textInfo);
            }
        }
    }
}