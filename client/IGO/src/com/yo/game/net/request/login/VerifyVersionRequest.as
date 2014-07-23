/**
 * Copyright (c) 2012, www.yo.com All rights reserved.
 */
package com.yo.game.net.request.login
{
    import com.yo.framework.net.IRequest;
    import com.yo.game.net.vo.*;
    import com.yo.framework.net.Packet;

    /**
     * 版本号的验证 不对就直接断开连接(1:4)
     */
    public class VerifyVersionRequest implements IRequest
    {
        /**
         * 版本号
         */
        public var version:uint;
    
        public function get module():uint
        {
            return 1;
        }

        public function get action():uint
        {
            return 4;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(version);
        }
    }
}