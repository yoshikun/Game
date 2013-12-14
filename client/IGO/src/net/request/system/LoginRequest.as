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
            p.writeShort(gameType);
            p.writeUnsignedInt(gameZone);
            p.writeByte(netType);
        }
    }
}