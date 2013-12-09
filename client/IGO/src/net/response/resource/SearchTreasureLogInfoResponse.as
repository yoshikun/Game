/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.resource
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 探宝日志(14:6)
     */
    public class SearchTreasureLogInfoResponse implements IResponse
    {
        /**
         * 1个人日志 2全局日志
         */
        public var type:uint;

        /**
         * 数量
         */
        public var num:uint;

        /**
         * 日志信息
         */
        public var infoList:Array /* of SearchTreasLog */;

        public function read(p:Packet):void
        {

            type = p.readUnsignedByte();
            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var searchTreasLog:SearchTreasLog = new SearchTreasLog();
                searchTreasLog.pos = p.readUnsignedShort();
                searchTreasLog.name = p.readMultiByte(33, "utf-8");
                searchTreasLog.item = p.readUnsignedInt();
                searchTreasLog.num = p.readUnsignedShort();
                searchTreasLog.rare = p.readUnsignedByte();
                searchTreasLog.time = p.readUnsignedInt();
                infoList.push(searchTreasLog);
            }
        }
    }
}