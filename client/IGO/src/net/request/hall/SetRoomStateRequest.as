/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.hall
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 设置房间状态(4:38)
     */
    public class SetRoomStateRequest implements IRequest
    {
        /**
         * 0满3人自动开始 1不显示房间信息
         */
        public var type:uint;
    
        public function get module():int
        {
            return 4;
        }

        public function get action():int
        {
            return 38;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(type);
        }
    }
}