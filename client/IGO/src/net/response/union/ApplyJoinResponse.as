/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.union
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 申请加入公会返回(7:12)
     */
    public class ApplyJoinResponse implements IResponse
    {
        /**
         * 0申请加入 1取消申请
         */
        public var type:uint;

        /**
         * 0已接受 1已有申请记录 2已在公会 3等级不够 4取消申请 5同意 6拒绝 7未开放 8加入处罚期 9人已满 10错误
         */
        public var ret:uint;

        /**
         * 申请加入公会ID
         */
        public var unionID:uint;

        public function read(p:Packet):void
        {

            type = p.readUnsignedByte();
            ret = p.readUnsignedByte();
            unionID = p.readUnsignedInt();
        }
    }
}