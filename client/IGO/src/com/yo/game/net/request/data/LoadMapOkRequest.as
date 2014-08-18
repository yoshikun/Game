/**
 * Copyright (c) 2012, www.yo.com All rights reserved.
 */
package com.yo.game.net.request.data
{
    import com.yo.framework.net.IRequest;
    import com.yo.game.net.vo.*;
    import com.yo.framework.net.Packet;

    /**
     * 客户端加载地图完成(2:9)
     */
    public class LoadMapOkRequest implements IRequest
    {
        public function get module():uint
        {
            return 2;
        }

        public function get action():uint
        {
            return 9;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}