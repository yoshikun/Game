/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.quest
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 放弃任务返回(12:8)
     */
    public class QuitQuestResponse implements IResponse
    {
        /**
         * 放弃任务返回 0成功 1不能放弃 2任务不存在 3未知错误
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