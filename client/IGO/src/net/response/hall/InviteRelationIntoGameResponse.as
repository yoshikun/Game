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
     * 邀请好友加入游戏返回(4:20)
     */
    public class InviteRelationIntoGameResponse implements IResponse
    {
        /**
         * 0成功 1已在游戏 2不在线 3黑名单 4过于频繁 5受惩罚 6副本未开启 7不是公会成员 8错误
         */
        public var ret:uint;

        /**
         * 被邀请者名称
         */
        public var name:String;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            name = p.readMultiByte(33, "utf-8");
        }
    }
}