/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 英雄升级、进阶加速（修改冷却时间）(11:33)
     */
    public class UpgradeHeroSpeedRequest implements IRequest
    {
        /**
         * 英雄ID
         */
        public var heroID:uint;
    
        /**
         * 类型 1进阶 2升级
         */
        public var type:uint;
    
        public function get module():int
        {
            return 11;
        }

        public function get action():int
        {
            return 33;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(heroID);
            p.writeByte(type);
        }
    }
}