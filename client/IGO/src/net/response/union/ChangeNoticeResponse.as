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
     * 改变公会公告返回(7:22)
     */
    public class ChangeNoticeResponse implements IResponse
    {
        /**
         * 改变公会公告返回 0成功 1没有权限 2错误
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
        }
    }
}