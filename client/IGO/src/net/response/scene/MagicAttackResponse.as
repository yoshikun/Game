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
     * 技能释放(5:43)
     */
    public class MagicAttackResponse implements IResponse
    {
        /**
         * 结果0失败 1成功
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
         * 方向 0上 1右上 2右 3右下 4下 5左下 6左 7左上 8错误
         */
        public var direct:uint;

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
            direct = p.readUnsignedByte();
        }
    }
}