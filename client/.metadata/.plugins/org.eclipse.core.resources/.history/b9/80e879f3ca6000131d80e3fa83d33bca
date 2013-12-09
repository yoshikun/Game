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
     * 邀请入会通知(7:57)
     */
    public class UnionRequestNotifyResponse implements IResponse
    {
        /**
         * 邀请者
         */
        public var name:String;

        /**
         * 公会ID
         */
        public var unionID:uint;

        /**
         * 公会名称
         */
        public var unionName:String;

        public function read(p:Packet):void
        {

            name = p.readMultiByte(33, "utf-8");
            unionID = p.readUnsignedInt();
            unionName = p.readMultiByte(33, "utf-8");
        }
    }
}