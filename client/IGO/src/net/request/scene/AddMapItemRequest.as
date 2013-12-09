/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.scene
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 物品掉落(5:77)
     */
    public class AddMapItemRequest implements IRequest
    {
        public function get module():uint
        {
            return 5;
        }

        public function get action():uint
        {
            return 77;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}