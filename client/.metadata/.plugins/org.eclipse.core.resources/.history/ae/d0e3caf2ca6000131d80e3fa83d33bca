/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 英雄进阶(11:31)
     */
    public class UpgradeHeroQualityRequest implements IRequest
    {
        /**
         * 英雄ID
         */
        public var heroID:uint;
    
        public function get module():uint
        {
            return 11;
        }

        public function get action():uint
        {
            return 31;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(heroID);
        }
    }
}