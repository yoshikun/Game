/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.scene
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 设置状态(5:45)
     */
    public class SetStateRequest implements IRequest
    {
        public function get module():int
        {
            return 5;
        }

        public function get action():int
        {
            return 45;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}