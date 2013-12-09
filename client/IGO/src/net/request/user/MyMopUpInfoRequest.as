/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 查询我的扫荡信息(2:97)
     */
    public class MyMopUpInfoRequest implements IRequest
    {
        public function get module():int
        {
            return 2;
        }

        public function get action():int
        {
            return 97;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}