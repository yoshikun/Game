/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 请求刷新神之挑战模式(2:47)
     */
    public class RefreshGodmodeRequest implements IRequest
    {
        public function get module():int
        {
            return 2;
        }

        public function get action():int
        {
            return 47;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}