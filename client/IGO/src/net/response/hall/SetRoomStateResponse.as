/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.hall
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 设置房间状态(4:39)
     */
    public class SetRoomStateResponse implements IResponse
    {
        /**
         * 0成功 1失败
         */
        public var ret:uint;

        /**
         * 0满3人自动开始 1不显示房间信息
         */
        public var type:uint;

        /**
         * 0未选中 1选中
         */
        public var state:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            type = p.readUnsignedByte();
            state = p.readUnsignedByte();
        }
    }
}