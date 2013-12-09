/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.scene
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 死亡通知(5:51)
     */
    public class DeathNotifyRequest implements IRequest
    {
        public function get module():int
        {
            return 5;
        }

        public function get action():int
        {
            return 51;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}