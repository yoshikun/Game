/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.dare
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 查询我的竞技日志(13:6)
     */
    public class ReqMyPkLogResponse implements IResponse
    {
        /**
         * 数量
         */
        public var num:uint;

        /**
         * 数据
         */
        public var infoList:Array /* of PKLogInfo */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var pKLogInfo:PKLogInfo = new PKLogInfo();
                pKLogInfo.type = p.readUnsignedByte();
                pKLogInfo.pkUser = p.readUnsignedInt();
                pKLogInfo.pkUserName = p.readMultiByte(33, "utf-8");
                pKLogInfo.time = p.readUnsignedInt();
                pKLogInfo.value = p.readUnsignedInt();
                infoList.push(pKLogInfo);
            }
        }
    }
}