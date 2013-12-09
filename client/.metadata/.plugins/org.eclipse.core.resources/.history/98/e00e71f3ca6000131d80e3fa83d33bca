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
     * 请求指定用户的所有状态返回(8:4)
     */
    public class GetUserStatesResponse implements IResponse
    {
        /**
         * 用户ID
         */
        public var userID:uint;

        /**
         * 状态数量
         */
        public var num:uint;

        /**
         * 状态信息
         */
        public var stateInfoList:Array /* of StateInfo */;

        public function read(p:Packet):void
        {

            userID = p.readUnsignedInt();
            num = p.readUnsignedShort();
			stateInfoList = [];
            for(var i:int = 0; i < num; i++){
                var stateInfo:StateInfo = new StateInfo();
                stateInfo.stateID = p.readUnsignedInt();
                stateInfo.lastTime = p.readUnsignedInt();
                stateInfoList.push(stateInfo);
            }
        }
    }
}