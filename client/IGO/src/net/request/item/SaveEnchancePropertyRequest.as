/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 保存装备洗练效果(11:19)
     */
    public class SaveEnchancePropertyRequest implements IRequest
    {
        /**
         * 类型 1保存 2维持
         */
        public var type:uint;
    
        /**
         * 装备ID
         */
        public var item:uint;
    
        public function get module():int
        {
            return 11;
        }

        public function get action():int
        {
            return 19;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(type);
            p.writeUnsignedInt(item);
        }
    }
}