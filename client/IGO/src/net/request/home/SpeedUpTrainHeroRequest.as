/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.home
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 加速训练进度(15:11)
     */
    public class SpeedUpTrainHeroRequest implements IRequest
    {
        /**
         * 栏位ID（1,2,3,4）
         */
        public var id:uint;
    
        public function get module():int
        {
            return 15;
        }

        public function get action():int
        {
            return 11;
        }

        public function write(p:Packet):void
        {
            
            p.writeShort(id);
        }
    }
}