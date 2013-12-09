/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.scene
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 批量移除人物（宠物）(5:15)
     */
    public class BatchRemoveMapDataRequest implements IRequest
    {
        public function get module():uint
        {
            return 5;
        }

        public function get action():uint
        {
            return 15;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}