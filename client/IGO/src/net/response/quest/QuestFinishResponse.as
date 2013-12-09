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
     * 结束任务(12:11)
     */
    public class QuestFinishResponse implements IResponse
    {
        /**
         * 0成功 1已递交 2失败
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