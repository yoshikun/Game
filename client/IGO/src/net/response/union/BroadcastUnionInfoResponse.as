/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.union
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 公会状态及信息通知(7:32)
     */
    public class BroadcastUnionInfoResponse implements IResponse
    {
        /**
         * 消息类型 1公会建立 2公会解散 3公告更新 4状态更新
         */
        public var type:uint;

        /**
         * 公会ID
         */
        public var id:uint;

        /**
         * 公会名称
         */
        public var unionName:String;

        /**
         * 公会状态
         */
        public var state:uint;

        /**
         * 公告
         */
        public var note:String;

        public function read(p:Packet):void
        {

            type = p.readUnsignedByte();
            id = p.readUnsignedInt();
            unionName = p.readMultiByte(33, "utf-8");
            state = p.readUnsignedByte();
            note = p.readMultiByte(255, "utf-8");
        }
    }
}