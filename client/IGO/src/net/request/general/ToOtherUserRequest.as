/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.general
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 发送给指定用户(9:1)
     */
    public class ToOtherUserRequest implements IRequest
    {
        /**
         * 接受者id
         */
        public var targetID:uint;
    
        /**
         * 信息内容
         */
        public var info:String;
    
        public function get module():int
        {
            return 9;
        }

        public function get action():int
        {
            return 1;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(targetID);
            p.writeUTF(info);
        }
    }
}