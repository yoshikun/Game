/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.state
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 请求添加状态返回(8:2)
     */
    public class AddStateResponse implements IResponse
    {
        /**
         * 用户ID
         */
        public var userID:uint;

        /**
         * 状态信息
         */
        public var stateInfo:StateInfo;

        /**
         * 返回0ok1找不到物品2找不到道具表3钱不够
         */
        public var result:uint;

        public function read(p:Packet):void
        {

            userID = p.readUnsignedInt();
            stateInfo = new StateInfo();
            stateInfo.stateID = p.readUnsignedInt();
            stateInfo.lastTime = p.readUnsignedInt();
            result = p.readUnsignedByte();
        }
    }
}