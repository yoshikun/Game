/**
 * Copyright (c) 2012, www.yo.com All rights reserved.
 */
package com.yo.game.net.request.login
{
    import com.yo.framework.net.IRequest;
    import com.yo.game.net.vo.*;
    import com.yo.framework.net.Packet;

    /**
     * 注册时检查name是否被使用(1:11)
     */
    public class CheckNameRequest implements IRequest
    {
        /**
         * 用户ID
         */
        public var accid:uint;
    
        /**
         * name
         */
        public var name:String;
    
        public function get module():uint
        {
            return 1;
        }

        public function get action():uint
        {
            return 11;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(accid);
            p.writeMultiBytes(name, 32);
        }
    }
}