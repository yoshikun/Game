/**
 * Copyright (c) 2012, www.yo.com All rights reserved.
 */
package com.yo.game.net.request.mapscene
{
    import com.yo.framework.net.IRequest;
    import com.yo.game.net.vo.*;
    import com.yo.framework.net.Packet;

    /**
     * 占位(3:1)
     */
    public class AddUserAndPosMapScreenStateRequest implements IRequest
    {
        public function get module():uint
        {
            return 3;
        }

        public function get action():uint
        {
            return 1;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}