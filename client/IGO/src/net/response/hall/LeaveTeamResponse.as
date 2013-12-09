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
     * 离开队伍(4:55)
     */
    public class LeaveTeamResponse implements IResponse
    {
        /**
         * 结果 0成功,1失败
         */
        public var ret:uint;

        /**
         * 离开队伍的用户
         */
        public var userID:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            userID = p.readUnsignedInt();
        }
    }
}