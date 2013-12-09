/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.union
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 申请加入公会(7:11)
     */
    public class ApplyJoinRequest implements IRequest
    {
        /**
         * 0申请加入 1取消申请
         */
        public var type:uint;
    
        /**
         * 申请加入公会ID
         */
        public var unionID:uint;
    
        public function get module():uint
        {
            return 7;
        }

        public function get action():uint
        {
            return 11;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(type);
            p.writeUnsignedInt(unionID);
        }
    }
}