/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.home
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 祝福日志(15:38)
     */
    public class ReqBlessLogResponse implements IResponse
    {
        /**
         * 数量
         */
        public var num:uint;

        /**
         * 信息
         */
        public var infoList:Array /* of BlessLogInfo */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var blessLogInfo:BlessLogInfo = new BlessLogInfo();
                blessLogInfo.userID = p.readUnsignedInt();
                blessLogInfo.userName = p.readMultiByte(33, "utf-8");
                blessLogInfo.time = p.readUnsignedInt();
                infoList.push(blessLogInfo);
            }
        }
    }
}