/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.relation
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 邀请加好友(10:5)
     */
    public class RelationInteractionRequest implements IRequest
    {
        /**
         * 邀请人
         */
        public var userID:uint;
    
        /**
         * 邀请人名称
         */
        public var name:String;
    
        /**
         * 被邀请人名称
         */
        public var relationName:String;
    
        /**
         * 状态 0邀请某人 1同意邀请 2拒绝邀请 
         */
        public var state:uint;
    
        public function get module():uint
        {
            return 10;
        }

        public function get action():uint
        {
            return 5;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(userID);
            p.writeMultiBytes(name, 33);
            p.writeMultiBytes(relationName, 33);
            p.writeByte(state);
        }
    }
}