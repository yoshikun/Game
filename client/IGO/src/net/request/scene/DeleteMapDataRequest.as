/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.scene
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 移除人物（宠物）(5:11)
     */
    public class DeleteMapDataRequest implements IRequest
    {
        public function get module():int
        {
            return 5;
        }

        public function get action():int
        {
            return 11;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}