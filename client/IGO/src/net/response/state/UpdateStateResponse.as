/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.state
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 服务器自动返回更新状态(8:8)
     */
    public class UpdateStateResponse implements IResponse
    {
        /**
         * 用户ID
         */
        public var userID:uint;

        /**
         * 删除的状态id(需要替换的)
         */
        public var stateID:uint;

        /**
         * 更新的状态信息
         */
        public var stateInfo:StateInfo;

        public function read(p:Packet):void
        {

            userID = p.readUnsignedInt();
            stateID = p.readUnsignedInt();
            stateInfo = new StateInfo();
            stateInfo.stateID = p.readUnsignedInt();
            stateInfo.lastTime = p.readUnsignedInt();
        }
    }
}