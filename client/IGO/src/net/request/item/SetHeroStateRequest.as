/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 设置英雄的状态(11:55)
     */
    public class SetHeroStateRequest implements IRequest
    {
        /**
         * 英雄ID
         */
        public var id:uint;
    
        /**
         * 状态 1出征 2休息 3训练 4取消训练
         */
        public var state:uint;
    
        public function get module():int
        {
            return 11;
        }

        public function get action():int
        {
            return 55;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
            p.writeByte(state);
        }
    }
}