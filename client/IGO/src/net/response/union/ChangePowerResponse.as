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
     * 改变公会成员权限返回(7:20)
     */
    public class ChangePowerResponse implements IResponse
    {
        /**
         * 改变公会成员权限返回 0成功 1没有权限 2不能更改自身权限 3管理员人数已满 4错误
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
        }
    }
}