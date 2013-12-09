/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.scene
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 宠物场景数据添加及更新(5:23)
     */
    public class ScenePetInfoRequest implements IRequest
    {
        public function get module():int
        {
            return 5;
        }

        public function get action():int
        {
            return 23;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}