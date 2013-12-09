/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.scene
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 结束胜利倒计时(5:81)
     */
    public class RightNowGameOverRequest implements IRequest
    {
        public function get module():int
        {
            return 5;
        }

        public function get action():int
        {
            return 81;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}