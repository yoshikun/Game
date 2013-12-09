/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.resource
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 探宝(14:3)
     */
    public class SearchTreasureInfoRequest implements IRequest
    {
        /**
         * 探宝次数
         */
        public var num:uint;
    
        public function get module():uint
        {
            return 14;
        }

        public function get action():uint
        {
            return 3;
        }

        public function write(p:Packet):void
        {
            
            p.writeShort(num);
        }
    }
}