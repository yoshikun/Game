/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.system
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 刷新配置文件(1:9)
     */
    public class ReloadConfigRequest implements IRequest
    {
        public function get module():int
        {
            return 1;
        }

        public function get action():int
        {
            return 9;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}