/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 删除礼包(11:47)
     */
    public class DeleteGiftPackRequest implements IRequest
    {
        /**
         * 礼包ID 0为全部删除
         */
        public var id:uint;
    
        public function get module():uint
        {
            return 11;
        }

        public function get action():uint
        {
            return 47;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
        }
    }
}