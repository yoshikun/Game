/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 系统设置(2:63)
     */
    public class SetSystemSettingsRequest implements IRequest
    {
        /**
         * 数据内容，按位设置（1显示套装 2允许好友申请 3允许公会申请 4显示玩家名字 5显示公会名称 6私聊 7世界聊天 8公会聊天 9场景聊天 10特效开关 11音效 12音乐）
         */
        public var dataList:Array;
    
        public function get module():uint
        {
            return 2;
        }

        public function get action():uint
        {
            return 63;
        }

        public function write(p:Packet):void
        {
            
			var len:int = dataList.length;
			for (var i:int = 0; i < 5; i++){
				p.writeUnsignedInt(dataList[i]);
			}
        }
    }
}