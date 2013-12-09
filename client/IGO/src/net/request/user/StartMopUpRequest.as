/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 开始扫荡(2:99)
     */
    public class StartMopUpRequest implements IRequest
    {
        /**
         * 副本类型 1单人副本 2千层塔
         */
        public var sceneType:uint;
    
        /**
         * 扫荡单人副本要指定副本ID
         */
        public var sceneID:uint;
    
        /**
         * 消耗的精力值
         */
        public var vigour:uint;
    
        /**
         * 自动出售 1自动 0不自动
         */
        public var autoSell:uint;
    
        /**
         * 出售品质以上的物品
         */
        public var sellQuality:uint;
    
        public function get module():int
        {
            return 2;
        }

        public function get action():int
        {
            return 99;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(sceneType);
            p.writeUnsignedInt(sceneID);
            p.writeUnsignedInt(vigour);
            p.writeByte(autoSell);
            p.writeByte(sellQuality);
        }
    }
}