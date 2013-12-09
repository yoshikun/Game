/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.scene
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 资源塔信息(5:59)
     */
    public class ResourcePetInfoRequest implements IRequest
    {
        public function get module():int
        {
            return 5;
        }

        public function get action():int
        {
            return 59;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}