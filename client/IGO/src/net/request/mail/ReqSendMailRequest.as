/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.mail
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 发邮件(18:1)
     */
    public class ReqSendMailRequest implements IRequest
    {
        /**
         * 收件人
         */
        public var toName:String;
    
        /**
         * 邮件主题
         */
        public var title:String;
    
        /**
         * 文本内容
         */
        public var text:String;
    
        /**
         * 需要金钱
         */
        public var recvMoney:uint;
    
        /**
         * 需要游戏币
         */
        public var recvGold:uint;
    
        public function get module():int
        {
            return 18;
        }

        public function get action():int
        {
            return 1;
        }

        public function write(p:Packet):void
        {
            
            p.writeMultiBytes(toName, 33);
            p.writeMultiBytes(title, 33);
            p.writeMultiBytes(text, 256);
            p.writeUnsignedInt(recvMoney);
            p.writeUnsignedInt(recvGold);
        }
    }
}