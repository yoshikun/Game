/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 用户技能收集奖励领取信息(2:79)
     */
    public class UserCollectRewardInfoRequest implements IRequest
    {
        /**
         * 0技能图鉴 1英雄图鉴
         */
        public var type:uint;
    
        /**
         * 区域ID 技能图鉴需要发
         */
        public var zone:uint;
    
        public function get module():uint
        {
            return 2;
        }

        public function get action():uint
        {
            return 79;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(type);
            p.writeUnsignedInt(zone);
        }
    }
}