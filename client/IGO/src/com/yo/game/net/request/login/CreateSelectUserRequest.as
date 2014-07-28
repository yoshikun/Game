/**
 * Copyright (c) 2012, www.yo.com All rights reserved.
 */
package com.yo.game.net.request.login
{
    import com.yo.framework.net.IRequest;
    import com.yo.game.net.vo.*;
    import com.yo.framework.net.Packet;

    /**
     * 创建角色(1:13)
     */
    public class CreateSelectUserRequest implements IRequest
    {
        /**
         * name
         */
        public var name:String;
    
        /**
         * 性别 1:男 2:女
         */
        public var sex:uint;
    
        /**
         * 职业
         */
        public var career:uint;
    
        /**
         * 国家id
         */
        public var country:uint;
    
        public function get module():uint
        {
            return 1;
        }

        public function get action():uint
        {
            return 13;
        }

        public function write(p:Packet):void
        {
            
            p.writeMultiBytes(name, 32);
            p.writeByte(sex);
            p.writeByte(career);
            p.writeShort(country);
        }
    }
}