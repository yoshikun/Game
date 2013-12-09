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
     * 移除成员返回(7:26)
     */
    public class RemoveMemberResponse implements IResponse
    {
        /**
         * 移除成员返回 0成功 1没有权限 2不能踢出自己 3错误
         */
        public var ret:uint;

        /**
         * 移除成员ID
         */
        public var id:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            id = p.readUnsignedInt();
        }
    }
}