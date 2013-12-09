/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.scene
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 移动(5:9)
     */
    public class MoveRequest implements IRequest
    {
        /**
         * ID
         */
        public var guid:GUID;
    
        /**
         * 移动状态 0停止 1移动
         */
        public var state:uint;
    
        /**
         * 移动角度
         */
        public var angle:Number;
    
        /**
         * 当前x坐标
         */
        public var x:uint;
    
        /**
         * 当前y坐标
         */
        public var y:uint;
    
        /**
         * 目标点
         */
        public var destX:uint;
    
        /**
         * 目标点
         */
        public var destY:uint;
    
        public function get module():uint
        {
            return 5;
        }

        public function get action():uint
        {
            return 9;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(guid.id);
            p.writeByte(guid.type);
            p.writeByte(state);
            p.writeFloat(angle);
            p.writeShort(x);
            p.writeShort(y);
            p.writeShort(destX);
            p.writeShort(destY);
        }
    }
}