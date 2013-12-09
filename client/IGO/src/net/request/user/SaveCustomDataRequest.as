/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 保存一些自定义数据(2:57)
     */
    public class SaveCustomDataRequest implements IRequest
    {
        /**
         * 数据内容
         */
        public var text:String;
    
        public function get module():uint
        {
            return 2;
        }

        public function get action():uint
        {
            return 57;
        }

        public function write(p:Packet):void
        {
            
            p.writeUTF(text);
        }
    }
}