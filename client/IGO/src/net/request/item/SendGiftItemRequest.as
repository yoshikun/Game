/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 道具赠送(11:41)
     */
    public class SendGiftItemRequest implements IRequest
    {
        /**
         * 接收人昵称
         */
        public var name:String;
    
        /**
         * 道具信息
         */
        public var info:ItemNumInfo;
    
        public function get module():uint
        {
            return 11;
        }

        public function get action():uint
        {
            return 41;
        }

        public function write(p:Packet):void
        {
            
            p.writeMultiBytes(name, 33);
            p.writeUnsignedInt(info.id);
            p.writeUnsignedInt(info.num);
        }
    }
}