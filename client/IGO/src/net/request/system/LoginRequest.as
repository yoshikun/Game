/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.system
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 登录到登陆服(1:1)
     */
    public class LoginRequest implements IRequest
    {
        /**
         * 用户账号
         */
        public var account:String;
    
        /**
         * 用户登录用key
         */
        public var password:String;
    
        /**
         * 客户端版本号
         */
        public var version:uint;
    
        /**
         * 游戏区 从1开始
         */
        public var gameZone:uint;
    
        public function get module():int
        {
            return 1;
        }

        public function get action():int
        {
            return 1;
        }

        public function write(p:Packet):void
        {
            
            p.writeMultiBytes(account, 48);
            p.writeMultiBytes(password, 33);
            p.writeUnsignedInt(version);
            p.writeUnsignedInt(gameZone);
        }
    }
}