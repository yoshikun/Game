/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 保留游戏掉落道具(2:67)
     */
    public class KeepGameRewardRequest implements IRequest
    {
        public function get module():int
        {
            return 2;
        }

        public function get action():int
        {
            return 67;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}