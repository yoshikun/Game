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
     * 改变公会状态返回(7:29)
     */
    public class ChangeUnionStateResponse implements IResponse
    {
        /**
         * 0成功 1没有权限 2错误
         */
        public var ret:uint;

        /**
         * 当前状态0开放 1未开放
         */
        public var state:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            state = p.readUnsignedByte();
        }
    }
}