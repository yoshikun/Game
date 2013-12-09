/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.home
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 设置育魂珠状态(15:21)
     */
    public class SetTrainSoulStateRequest implements IRequest
    {
        /**
         * ID
         */
        public var id:uint;
    
        /**
         * 道具
         */
        public var item:uint;
    
        public function get module():int
        {
            return 15;
        }

        public function get action():int
        {
            return 21;
        }

        public function write(p:Packet):void
        {
            
            p.writeShort(id);
            p.writeUnsignedInt(item);
        }
    }
}