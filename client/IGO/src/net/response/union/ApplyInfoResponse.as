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
     * 请求本人申请加入公会信息返回(7:8)
     */
    public class ApplyInfoResponse implements IResponse
    {
        /**
         * 公会ID
         */
        public var id:uint;

        public function read(p:Packet):void
        {

            id = p.readUnsignedInt();
        }
    }
}