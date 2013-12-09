/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.home
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 开放的功能列表(15:3)
     */
    public class OpenFunctionListRequest implements IRequest
    {
        public function get module():int
        {
            return 15;
        }

        public function get action():int
        {
            return 3;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}