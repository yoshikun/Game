/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.home
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 加速育魂珠进度(15:25)
     */
    public class SpeedUpTrainSoulRequest implements IRequest
    {
        /**
         * ID（1,2,3,4）
         */
        public var id:uint;
    
        public function get module():uint
        {
            return 15;
        }

        public function get action():uint
        {
            return 25;
        }

        public function write(p:Packet):void
        {
            
            p.writeShort(id);
        }
    }
}