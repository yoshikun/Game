/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.union
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 邀请入会应答(7:58)
     */
    public class InviteUnionAnswerRequest implements IRequest
    {
        /**
         * 0同意 1拒绝
         */
        public var result:uint;
    
        /**
         * 邀请者
         */
        public var name:String;
    
        /**
         * 公会ID
         */
        public var unionID:uint;
    
        public function get module():uint
        {
            return 7;
        }

        public function get action():uint
        {
            return 58;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(result);
            p.writeMultiBytes(name, 33);
            p.writeUnsignedInt(unionID);
        }
    }
}