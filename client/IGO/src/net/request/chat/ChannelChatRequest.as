/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.chat
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 聊天(6:1)
     */
    public class ChannelChatRequest implements IRequest
    {
        /**
         * 消息类型 1世界 2公会 3对战 4私聊 5系统 6GM 7喇叭 8当前 9NPC说话 10系统喇叭
         */
        public var type:uint;
    
        /**
         * 私聊对象
         */
        public var userID:uint;
    
        /**
         * 信息内容
         */
        public var text:String;
    
        /**
         * 展示物品数量
         */
        public var num:uint;
    
        /**
         * 数据ID
         */
        public var idList:Array;
    
        public function get module():int
        {
            return 6;
        }

        public function get action():int
        {
            return 1;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(type);
            p.writeUnsignedInt(userID);
            p.writeUTF(text);
            p.writeShort(num);
			var len:int = idList.length;
			for (var i:int = 0; i < len; i++){
				var info:ItemDataID = idList[i] as ItemDataID;
				p.writeUnsignedInt(info.baseID);
				p.writeUnsignedInt(info.id);
			}
        }
    }
}