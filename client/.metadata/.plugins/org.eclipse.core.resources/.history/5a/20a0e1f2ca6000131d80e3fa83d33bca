/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.union
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 批复申请(7:17)
     */
    public class AllowApplyRequest implements IRequest
    {
        /**
         * 0单个批复 1全部批复
         */
        public var type:uint;
    
        /**
         * 申请者ID 用于单个批复
         */
        public var id:uint;
    
        /**
         * 0同意 1拒绝
         */
        public var result:uint;
    
        public function get module():uint
        {
            return 7;
        }

        public function get action():uint
        {
            return 17;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(type);
            p.writeUnsignedInt(id);
            p.writeByte(result);
        }
    }
}