/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.dare
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 角斗场立即加入匹配(13:23)
     */
    public class DareMatchGmaeRequest implements IRequest
    {
        public function get module():uint
        {
            return 13;
        }

        public function get action():uint
        {
            return 23;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}