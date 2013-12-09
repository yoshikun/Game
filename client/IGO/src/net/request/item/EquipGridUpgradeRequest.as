/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 装备格子升级(11:23)
     */
    public class EquipGridUpgradeRequest implements IRequest
    {
        /**
         * 格子ID （1,2,3,4,5）
         */
        public var id:uint;
    
        public function get module():int
        {
            return 11;
        }

        public function get action():int
        {
            return 23;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(id);
        }
    }
}