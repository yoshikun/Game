/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.chat
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 系统公告(6:4)
     */
    public class SysNotifyResponse implements IResponse
    {
        /**
         * 消息类型 1.系统 2.GM 3.喇叭
         */
        public var type:uint;

        /**
         * 系统消息类型 1系统消息（在聊天窗口显示）2.公告栏
         */
        public var sysInfoType:uint;

        /**
         * 发消息时间
         */
        public var chatTime:uint;

        /**
         * 发消息的name
         */
        public var nickName:String;

        /**
         * 标题
         */
        public var title:String;

        /**
         * 链接
         */
        public var url:String;

        /**
         * 信息内容
         */
        public var text:String;

        public function read(p:Packet):void
        {

            type = p.readUnsignedByte();
            sysInfoType = p.readUnsignedByte();
            chatTime = p.readUnsignedInt();
            nickName = p.readMultiByte(33, "utf-8");
            title = p.readMultiByte(33, "utf-8");
            url = p.readMultiByte(128, "utf-8");
            text = p.readUTF();
        }
    }
}