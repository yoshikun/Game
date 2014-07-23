/**
 * Copyright (c) 2012, www.yo.com All rights reserved.
 */
package com.yo.game.net.request.login
{
    import com.yo.framework.net.IRequest;
    import com.yo.game.net.vo.*;
    import com.yo.framework.net.Packet;

    /**
     * 登录请求(1:1)
     */
    public class LoginRequest implements IRequest
    {
        /**
         * 用户账号
         */
        public var account:String;
    
        /**
         * 密码
         */
        public var passwd:String;
    
        /**
         * 游戏平台类型 从1000开始
         */
        public var gameType:uint;
    
        /**
         * 游戏区 从1开始
         */
        public var gameZone:uint;
    
        /**
         * 1:电信 2:网通
         */
        public var netType:uint;
    
        public function get module():uint
        {
            return 1;
        }

        public function get action():uint
        {
            return 1;
        }

        public function write(p:Packet):void
        {
            
            p.writeMultiBytes(account, 32);
            p.writeMultiBytes(passwd, 32);
            p.writeShort(gameType);
            p.writeUnsignedInt(gameZone);
            p.writeByte(netType);
        }
    }
}