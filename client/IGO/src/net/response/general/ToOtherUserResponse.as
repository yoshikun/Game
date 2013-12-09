/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.general
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 发送给指定用户(9:2)
     */
    public class ToOtherUserResponse implements IResponse
    {
        /**
         * 发送者id
         */
        public var userID:uint;

        /**
         * 信息内容
         */
        public var info:String;

        public function read(p:Packet):void
        {

            userID = p.readUnsignedInt();
            info = p.readUTF();
        }
    }
}