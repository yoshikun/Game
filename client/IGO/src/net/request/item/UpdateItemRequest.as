/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 更新道具数据(11:3)
     */
    public class UpdateItemRequest implements IRequest
    {
        public function get module():int
        {
            return 11;
        }

        public function get action():int
        {
            return 3;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}