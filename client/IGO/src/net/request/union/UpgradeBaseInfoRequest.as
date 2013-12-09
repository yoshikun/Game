/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.union
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 升级公会基地(7:35)
     */
    public class UpgradeBaseInfoRequest implements IRequest
    {
        /**
         * 修筑台ID
         */
        public var baseID:uint;
    
        public function get module():uint
        {
            return 7;
        }

        public function get action():uint
        {
            return 35;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(baseID);
        }
    }
}