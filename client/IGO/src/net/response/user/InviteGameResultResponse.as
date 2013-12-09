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
     * 邀请游戏应答(2:32)
     */
    public class InviteGameResultResponse implements IResponse
    {
        /**
         * 结果 0成功 1失效 2游戏惩罚中 3自身状态不对 4对方无法响应 5错误
         */
        public var ret:uint;

        /**
         * 0同意 1拒绝
         */
        public var result:uint;

        /**
         * 0副本邀请 1切磋邀请 2队伍邀请
         */
        public var kind:uint;

        /**
         * 邀请者名称
         */
        public var name:String;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            result = p.readUnsignedByte();
            kind = p.readUnsignedByte();
            name = p.readMultiByte(33, "utf-8");
        }
    }
}