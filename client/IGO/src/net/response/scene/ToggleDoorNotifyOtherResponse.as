/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.scene
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 触发传送门，通知其他人(5:76)
     */
    public class ToggleDoorNotifyOtherResponse implements IResponse
    {
        /**
         * 开启玩家ID
         */
        public var userID:uint;

        /**
         * 传送门ID
         */
        public var doorID:uint;

        /**
         * 0 进入 1离开
         */
        public var state:uint;

        /**
         * 0初始化 1 倒计时中 2取消
         */
        public var doorState:uint;

        public function read(p:Packet):void
        {

            userID = p.readUnsignedInt();
            doorID = p.readUnsignedInt();
            state = p.readUnsignedByte();
            doorState = p.readUnsignedByte();
        }
    }
}