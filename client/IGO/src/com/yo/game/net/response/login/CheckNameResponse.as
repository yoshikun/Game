/**
 * Copyright (c) 2012, www.yo.com All rights reserved.
 */
package com.yo.game.net.response.login
{
    import com.yo.framework.net.IResponse;
    import com.yo.game.net.vo.*;
    import com.yo.framework.net.Packet;

    /*@import*/

    /**
     * 返回检查name结果(1:12)
     */
    public class CheckNameResponse implements IResponse
    {
        /**
         * 用户ID
         */
        public var accid:uint;

        /**
         * 0:可以 1:重复
         */
        public var result:uint;

        /**
         * name
         */
        public var name:String;

        public function read(p:Packet):void
        {

            accid = p.readUnsignedInt();
            result = p.readUnsignedInt();
            name = p.readMultiByte(32, "utf-8");
        }
    }
}