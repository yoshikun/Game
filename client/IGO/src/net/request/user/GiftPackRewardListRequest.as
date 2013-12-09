/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 奖励礼包列表(2:131)
     */
    public class GiftPackRewardListRequest implements IRequest
    {
        public function get module():uint
        {
            return 2;
        }

        public function get action():uint
        {
            return 131;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}