/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.home
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 训练英雄(15:7)
     */
    public class TrainHeroRequest implements IRequest
    {
        /**
         * 栏位ID（1,2,3,4）
         */
        public var id:uint;
    
        /**
         * 英雄ID
         */
        public var heroID:uint;
    
        /**
         * 训练时常（秒数）
         */
        public var trainTime:uint;
    
        public function get module():int
        {
            return 15;
        }

        public function get action():int
        {
            return 7;
        }

        public function write(p:Packet):void
        {
            
            p.writeShort(id);
            p.writeUnsignedInt(heroID);
            p.writeUnsignedInt(trainTime);
        }
    }
}