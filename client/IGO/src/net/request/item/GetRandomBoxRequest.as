/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 随机宝箱掉落(11:67)
     */
    public class GetRandomBoxRequest implements IRequest
    {
        public function get module():int
        {
            return 11;
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