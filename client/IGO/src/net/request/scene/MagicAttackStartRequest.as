/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.scene
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 技能开始施法(5:41)
     */
    public class MagicAttackStartRequest implements IRequest
    {
        /**
         * 攻击编号
         */
        public var id:uint;
    
        /**
         * 攻击类型 0用户攻击用户 1用户攻击Npc 2Npc攻击用户 3 Npc攻击Npc
         */
        public var attackType:uint;
    
        /**
         * 防御编号
         */
        public var defenceID:uint;
    
        /**
         * 技能id
         */
        public var skillID:uint;
    
        /**
         * 目标点
         */
        public var xDes:uint;
    
        /**
         * 目标点
         */
        public var yDes:uint;
    
        /**
         * 方向 0上 1右上 2右 3右下 4下 5左下 6左 7左上 8错误
         */
        public var direct:uint;
    
        public function get module():int
        {
            return 5;
        }

        public function get action():int
        {
            return 41;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
            p.writeByte(attackType);
            p.writeUnsignedInt(defenceID);
            p.writeShort(skillID);
            p.writeShort(xDes);
            p.writeShort(yDes);
            p.writeByte(direct);
        }
    }
}