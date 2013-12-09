/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.home
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 训练栏信息(15:5)
     */
    public class TrainHeroListRequest implements IRequest
    {
        public function get module():uint
        {
            return 15;
        }

        public function get action():uint
        {
            return 5;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}