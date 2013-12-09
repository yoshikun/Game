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
     * 技能开始施法通知(5:42)
     */
    public class MagicAttackStartResultResponse implements IResponse
    {
        /**
         * 施法结果 0成功 1 cd时间未结束 2消耗不足 3目标非法 4禁止攻击 5技能非法 6被打断 7太远了 8主动取消(引导类技能才通知) 9目标已死亡 10超出范围失败
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
         * 目标点
         */
        public var xDes:uint;

        /**
         * 目标点
         */
        public var yDes:uint;

        /**
         * 魔法飞行时间（毫秒）
         */
        public var flyTime:uint;

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
            xDes = p.readUnsignedShort();
            yDes = p.readUnsignedShort();
            flyTime = p.readUnsignedShort();
            direct = p.readUnsignedByte();
        }
    }
}