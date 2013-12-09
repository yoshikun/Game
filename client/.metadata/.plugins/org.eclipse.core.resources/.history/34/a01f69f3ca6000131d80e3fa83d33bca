/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.scene
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 加载进度广播(5:90)
     */
    public class LoadingProgressNotifyResponse implements IResponse
    {
        /**
         * 用户ID
         */
        public var userID:uint;

        /**
         * 用户昵称
         */
        public var nickName:String;

        /**
         * 进度值
         */
        public var value:uint;

        public function read(p:Packet):void
        {

            userID = p.readUnsignedInt();
            nickName = p.readMultiByte(33, "utf-8");
            value = p.readUnsignedInt();
        }
    }
}