/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.home
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 考古区域信息(15:13)
     */
    public class SearchZoneListRequest implements IRequest
    {
        public function get module():uint
        {
            return 15;
        }

        public function get action():uint
        {
            return 13;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}