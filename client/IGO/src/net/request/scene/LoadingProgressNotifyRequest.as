/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.scene
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 加载进度广播(5:89)
     */
    public class LoadingProgressNotifyRequest implements IRequest
    {
        /**
         * 进度值
         */
        public var value:uint;
    
        public function get module():uint
        {
            return 5;
        }

        public function get action():uint
        {
            return 89;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(value);
        }
    }
}