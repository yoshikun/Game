/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 装备格子信息(11:21)
     */
    public class EquipGridInfoRequest implements IRequest
    {
        public function get module():uint
        {
            return 11;
        }

        public function get action():uint
        {
            return 21;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}