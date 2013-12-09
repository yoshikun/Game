/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.home
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 设置考古状态(15:15)
     */
    public class SetSearchStateRequest implements IRequest
    {
        /**
         * ID
         */
        public var id:SearchZoneID;
    
        public function get module():int
        {
            return 15;
        }

        public function get action():int
        {
            return 15;
        }

        public function write(p:Packet):void
        {
            
            p.writeShort(id.zoneID);
            p.writeShort(id.groupID);
        }
    }
}