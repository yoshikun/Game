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
     * 聊天(6:2)
     */
    public class ChannelChatResponse implements IResponse
    {
        /**
         * 消息类型 1世界 2公会 3对战 4私聊 5系统 6GM 7喇叭 8当前 9NPC说话 10系统喇叭
         */
        public var type:uint;

        /**
         * 系统消息类型 1系统消息（在聊天窗口显示）2屏幕上方显示 3黄金联赛消息盒子 4屏幕中间显示
         */
        public var sysInfoType:uint;

        /**
         * 发消息的对象id
         */
        public var userID:uint;

        /**
         * 聊天时间
         */
        public var chatTime:uint;

        /**
         * 发消息的name
         */
        public var nickName:String;

        /**
         * 信息内容
         */
        public var text:String;

        /**
         * 展示物品数量
         */
        public var num:uint;

        /**
         * 展示的物品信息
         */
        public var idList:Array /* of ItemDataID */;

        public function read(p:Packet):void
        {

            type = p.readUnsignedInt();
            sysInfoType = p.readUnsignedInt();
            userID = p.readUnsignedInt();
            chatTime = p.readUnsignedInt();
            nickName = p.readMultiByte(33, "utf-8");
            text = p.readUTF();
            num = p.readUnsignedShort();
			idList = [];
            for(var i:int = 0; i < num; i++){
                var itemDataID:ItemDataID = new ItemDataID();
                itemDataID.baseID = p.readUnsignedInt();
                itemDataID.id = p.readUnsignedInt();
                idList.push(itemDataID);
            }
        }
    }
}