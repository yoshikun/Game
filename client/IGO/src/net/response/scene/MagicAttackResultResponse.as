/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.scene
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 技能释放结果(5:44)
     */
    public class MagicAttackResultResponse implements IResponse
    {
        /**
         * 结果0失败 1成功 2无敌 3必杀 4伤害免疫 5 物理免疫 6魔法免疫 7吸收 8反弹
         */
        public var ret:uint;

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
         * 技能等级
         */
        public var skillLevel:uint;

        /**
         * 当前血
         */
        public var dwHp:uint;

        /**
         * 扣血
         */
        public var sdwHp:uint;

        /**
         * 0没暴 1 暴击
         */
        public var byLuck:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            id = p.readUnsignedInt();
            attackType = p.readUnsignedByte();
            defenceID = p.readUnsignedInt();
            skillID = p.readUnsignedShort();
            skillLevel = p.readUnsignedShort();
            dwHp = p.readUnsignedInt();
            sdwHp = p.readUnsignedInt();
            byLuck = p.readUnsignedByte();
        }
    }
}