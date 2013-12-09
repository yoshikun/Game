/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.user
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 用户获得经验(2:26)
     */
    public class UserObtainExpResponse implements IResponse
    {
        /**
         * 得到的经验
         */
        public var exp:uint;

        /**
         * 用户当前经验
         */
        public var allExp:uint;

        /**
         * 当日获得经验
         */
        public var dayObtainExp:uint;

        public function read(p:Packet):void
        {

            exp = p.readUnsignedInt();
            allExp = p.readUnsignedInt();
            dayObtainExp = p.readUnsignedInt();
        }
    }
}