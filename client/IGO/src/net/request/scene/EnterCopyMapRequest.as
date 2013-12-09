/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.scene
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 资源加载完成，进入副本地图(5:1)
     */
    public class EnterCopyMapRequest implements IRequest
    {
        public function get module():int
        {
            return 5;
        }

        public function get action():int
        {
            return 1;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}