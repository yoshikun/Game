/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 配置战斗道具(2:81)
     */
    public class DeployFightObjectRequest implements IRequest
    {
        /**
         * 0添加 1移除
         */
        public var type:uint;
    
        /**
         * 物品id
         */
        public var id:uint;
    
        /**
         * 位置
         */
        public var pos:uint;
    
        public function get module():uint
        {
            return 2;
        }

        public function get action():uint
        {
            return 81;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(type);
            p.writeUnsignedInt(id);
            p.writeByte(pos);
        }
    }
}