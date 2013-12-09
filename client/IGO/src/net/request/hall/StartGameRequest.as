/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.hall
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 房主开始游戏(4:22)
     */
    public class StartGameRequest implements IRequest
    {
        /**
         * 类型 0普通副本 1事件副本
         */
        public var type:uint;
    
        /**
         * 副本ID
         */
        public var sceneID:uint;
    
        public function get module():int
        {
            return 4;
        }

        public function get action():int
        {
            return 22;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(type);
            p.writeUnsignedInt(sceneID);
        }
    }
}