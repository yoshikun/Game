/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.relation
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 关系状态变更(10:3)
     */
    public class UpdateRelationStateRequest implements IRequest
    {
        public function get module():uint
        {
            return 10;
        }

        public function get action():uint
        {
            return 3;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}