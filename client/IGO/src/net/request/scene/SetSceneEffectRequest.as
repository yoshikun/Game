/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.scene
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 设置场景特效(5:67)
     */
    public class SetSceneEffectRequest implements IRequest
    {
        public function get module():uint
        {
            return 5;
        }

        public function get action():uint
        {
            return 67;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}