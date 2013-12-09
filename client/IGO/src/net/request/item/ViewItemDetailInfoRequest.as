/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 查看玩家展示的道具信息(11:49)
     */
    public class ViewItemDetailInfoRequest implements IRequest
    {
        /**
         * 道具所属玩家ID
         */
        public var userID:uint;
    
        /**
         * 物品唯一ID
         */
        public var itemID:uint;
    
        public function get module():uint
        {
            return 11;
        }

        public function get action():uint
        {
            return 49;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(userID);
            p.writeUnsignedInt(itemID);
        }
    }
}