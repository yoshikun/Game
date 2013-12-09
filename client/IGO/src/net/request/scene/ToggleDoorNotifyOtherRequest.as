/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.scene
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 触发传送门，通知其他人(5:75)
     */
    public class ToggleDoorNotifyOtherRequest implements IRequest
    {
        public function get module():int
        {
            return 5;
        }

        public function get action():int
        {
            return 75;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}