/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.hall
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 创建队伍(4:44)
     */
    public class CreateTeamInfoRequest implements IRequest
    {
        /**
         * 对于到副本类型
         */
        public var type:uint;
    
        public function get module():uint
        {
            return 4;
        }

        public function get action():uint
        {
            return 44;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(type);
        }
    }
}