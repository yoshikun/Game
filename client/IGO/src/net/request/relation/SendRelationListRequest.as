/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.relation
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 发送社会关系列表(10:1)
     */
    public class SendRelationListRequest implements IRequest
    {
        public function get module():uint
        {
            return 10;
        }

        public function get action():uint
        {
            return 1;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}