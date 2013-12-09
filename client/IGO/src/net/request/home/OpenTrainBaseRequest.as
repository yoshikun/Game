/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.home
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 道具开启训练栏位(15:9)
     */
    public class OpenTrainBaseRequest implements IRequest
    {
        /**
         * 栏位ID（1,2,3,4）
         */
        public var id:uint;
    
        public function get module():uint
        {
            return 15;
        }

        public function get action():uint
        {
            return 9;
        }

        public function write(p:Packet):void
        {
            
            p.writeShort(id);
        }
    }
}