/**
 * Copyright (c) 2012, www.yo.com All rights reserved.
 */
package com.yo.game.net.request.mapscene
{
    import com.yo.framework.net.IRequest;
    import com.yo.game.net.vo.*;
    import com.yo.framework.net.Packet;

    /**
     * 用户移动(3:5)
     */
    public class UserMoveRequest implements IRequest
    {
        /**
         * 方向
         */
        public var dir:uint;
    
        /**
         * 移动速度
         */
        public var speed:uint;
    
        /**
         * X
         */
        public var x:uint;
    
        /**
         * Y
         */
        public var y:uint;
    
        public function get module():uint
        {
            return 3;
        }

        public function get action():uint
        {
            return 5;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(dir);
            p.writeShort(speed);
            p.writeUnsignedInt(x);
            p.writeUnsignedInt(y);
        }
    }
}