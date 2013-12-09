/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.scene
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 进入站街地图(5:3)
     */
    public class EnterStationMapRequest implements IRequest
    {
        /**
         * 站街地图ID（应该大于一张地图，缓解下压力）
         */
        public var sceneID:uint;
    
        public function get module():int
        {
            return 5;
        }

        public function get action():int
        {
            return 3;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(sceneID);
        }
    }
}