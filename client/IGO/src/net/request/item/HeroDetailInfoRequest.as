/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 英雄详细信息(11:25)
     */
    public class HeroDetailInfoRequest implements IRequest
    {
        /**
         * 英雄 ID，为0则请求全部英雄
         */
        public var heroID:uint;
    
        public function get module():int
        {
            return 11;
        }

        public function get action():int
        {
            return 25;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(heroID);
        }
    }
}