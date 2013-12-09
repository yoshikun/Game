/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.union
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 邀请入会结果通知(7:60)
     */
    public class UnionRequestResultResponse implements IResponse
    {
        /**
         * 0成功 1对方以申请公会 2公会人以满 3对方拒绝 4错误
         */
        public var ret:uint;

        /**
         * 被邀请者
         */
        public var name:String;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            name = p.readMultiByte(33, "utf-8");
        }
    }
}