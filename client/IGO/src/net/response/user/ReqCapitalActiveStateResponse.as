/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.user
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 请求活动状态信息(2:116)
     */
    public class ReqCapitalActiveStateResponse implements IResponse
    {
        /**
         * 数量
         */
        public var num:uint;

        /**
         * 活动状态 0等待 1开始 2结束
         */
        public var infoList:Array /* of ActiveStateInfo */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var activeStateInfo:ActiveStateInfo = new ActiveStateInfo();
                activeStateInfo.id = p.readUnsignedInt();
                activeStateInfo.state = p.readUnsignedByte();
                infoList.push(activeStateInfo);
            }
        }
    }
}