/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.union
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 创建公会(7:9)
     */
    public class CreateUnionRequest implements IRequest
    {
        /**
         * 公会名称
         */
        public var name:String;
    
        public function get module():int
        {
            return 7;
        }

        public function get action():int
        {
            return 9;
        }

        public function write(p:Packet):void
        {
            
            p.writeMultiBytes(name, 33);
        }
    }
}