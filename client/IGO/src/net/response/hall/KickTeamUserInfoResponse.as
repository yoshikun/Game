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
     * 队伍踢出成员(4:51)
     */
    public class KickTeamUserInfoResponse implements IResponse
    {
        /**
         * 玩家ID
         */
        public var id:uint;

        /**
         * 0成功 1无权限 2失败
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            id = p.readUnsignedInt();
            ret = p.readUnsignedByte();
        }
    }
}