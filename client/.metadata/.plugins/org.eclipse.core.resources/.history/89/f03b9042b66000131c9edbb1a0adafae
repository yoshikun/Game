/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package com.yile.games.doll.net.{{subPath}}
{
    /**
     * {{info}}
     */
    public class {{requestClassName}} implements IRequest
    {
        /**
         * 用户唯一ID
         */
        public var accid:uint;
    
        /**
         * 用户登录用key
         */
        public var key:uint;
        
        {{#data}}
        	{{xml}}
        		asdfsafsfdsa
        	{{xml}}
        {{/data}}
    
        public function get module():uint
        {
            return {{cmdIndex}};
        }

        public function get action():uint
        {
            return {{paramIndex}};
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(accid);
            p.writeUnsignedInt(key);
        }
    }
}