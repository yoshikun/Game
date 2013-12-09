/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 重置御神器(2:77)
     */
    public class ResetGodCtrlInfoRequest implements IRequest
    {
        /**
         * 等级
         */
        public var level:uint;
    
        public function get module():uint
        {
            return 2;
        }

        public function get action():uint
        {
            return 77;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(level);
        }
    }
}