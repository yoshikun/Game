/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 御神器修炼(2:75)
     */
    public class RaiseGodCtrlInfoRequest implements IRequest
    {
        /**
         * 等级
         */
        public var level:uint;
    
        public function get module():int
        {
            return 2;
        }

        public function get action():int
        {
            return 75;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(level);
        }
    }
}