/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 英雄升级(11:35)
     */
    public class UpgradeHeroRequest implements IRequest
    {
        /**
         * 英雄ID
         */
        public var heroID:uint;
    
        public function get module():int
        {
            return 11;
        }

        public function get action():int
        {
            return 35;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(heroID);
        }
    }
}