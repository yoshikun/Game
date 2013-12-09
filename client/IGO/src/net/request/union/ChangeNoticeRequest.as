/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.union
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 改变公会公告(7:21)
     */
    public class ChangeNoticeRequest implements IRequest
    {
        /**
         * 公告内容
         */
        public var mes:String;
    
        public function get module():int
        {
            return 7;
        }

        public function get action():int
        {
            return 21;
        }

        public function write(p:Packet):void
        {
            
            p.writeMultiBytes(mes, 255);
        }
    }
}