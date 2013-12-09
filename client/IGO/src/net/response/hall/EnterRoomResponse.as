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
     * 进入房间(4:8)
     */
    public class EnterRoomResponse implements IResponse
    {
        /**
         * 结果 0成功 1房间人数已满 2人物状态不对 3等级不够 4不在规定时间 5已失效 6未知错误
         */
        public var result:uint;

        public function read(p:Packet):void
        {

            result = p.readUnsignedByte();
        }
    }
}