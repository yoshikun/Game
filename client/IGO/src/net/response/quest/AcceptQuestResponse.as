/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.quest
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 接收任务返回(12:6)
     */
    public class AcceptQuestResponse implements IResponse
    {
        /**
         * 接收任务返回 0成功 1等级不满足 2正在进行中 3不再有效时间内 4已完成不能重复 5前置任务未完成 6错误
         */
        public var ret:uint;

        /**
         * 任务ID
         */
        public var id:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            id = p.readUnsignedInt();
        }
    }
}