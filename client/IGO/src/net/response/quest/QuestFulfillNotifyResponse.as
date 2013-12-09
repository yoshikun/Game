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
     * 任务目标完成量通知(12:9)
     */
    public class QuestFulfillNotifyResponse implements IResponse
    {
        /**
         * 当前完成量
         */
        public var curnum:uint;

        /**
         * 条件ID
         */
        public var conditionID:uint;

        /**
         * 任务ID
         */
        public var id:uint;

        public function read(p:Packet):void
        {

            curnum = p.readUnsignedByte();
            conditionID = p.readUnsignedInt();
            id = p.readUnsignedInt();
        }
    }
}