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
     * 更新大厅中的角色状态(4:16)
     */
    public class HallUserStateResponse implements IResponse
    {
        /**
         * 用户
         */
        public var userID:uint;

        /**
         * 0 空闲 1进入房间 2准备状态 3匹配成功 4游戏准备状态 5开始游戏
         */
        public var state:uint;

        public function read(p:Packet):void
        {

            userID = p.readUnsignedInt();
            state = p.readUnsignedByte();
        }
    }
}