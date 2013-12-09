/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.relation
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 删除关系(10:9)
     */
    public class RemoveRelationRequest implements IRequest
    {
        /**
         * 关系人名称
         */
        public var relationName:String;
    
        public function get module():uint
        {
            return 10;
        }

        public function get action():uint
        {
            return 9;
        }

        public function write(p:Packet):void
        {
            
            p.writeMultiBytes(relationName, 33);
        }
    }
}