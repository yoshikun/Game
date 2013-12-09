/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 宝石转换(11:59)
     */
    public class StoneTransformRequest implements IRequest
    {
        /**
         * 宝石ID
         */
        public var id:uint;
    
        /**
         * 转换数量
         */
        public var num:uint;
    
        /**
         * 转换目标
         */
        public var target:uint;
    
        public function get module():uint
        {
            return 11;
        }

        public function get action():uint
        {
            return 59;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
            p.writeShort(num);
            p.writeUnsignedInt(target);
        }
    }
}