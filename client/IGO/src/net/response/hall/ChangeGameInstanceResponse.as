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
     * 更换副本返回(4:18)
     */
    public class ChangeGameInstanceResponse implements IResponse
    {
        /**
         * 不满足要求用户ID
         */
        public var id:uint;

        /**
         * 结果 0.成功 1.成员等级不满足要求 2.没权限 3不在规定时间 4.未知错误
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            id = p.readUnsignedInt();
            ret = p.readUnsignedByte();
        }
    }
}