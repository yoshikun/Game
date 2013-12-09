/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 英雄详细信息
     */
    public class HeroInfo
    {
        /**
         * 数据ID
         */
        public var baseID:uint;

        /**
         * 名字
         */
        public var name:String;

        /**
         * 种族
         */
        public var race:uint;

        /**
         * 等级
         */
        public var level:uint;

        /**
         * 移动速度
         */
        public var moveSpeed:uint;

        /**
         * 攻击速度
         */
        public var attackSpeed:uint;

        /**
         * 攻击距离
         */
        public var adistance:uint;

        /**
         * 视野距离
         */
        public var vision:uint;

        /**
         * 当前生命值
         */
        public var hp:uint;

        /**
         * 最大生命值
         */
        public var maxHP:uint;

        /**
         * 每秒生命值恢复
         */
        public var hpRegen:uint;

        /**
         * 当前愤怒值
         */
        public var sp:uint;

        /**
         * 最大愤怒值
         */
        public var maxSP:uint;

        /**
         * 愤怒值恢复
         */
        public var spRegen:uint;

        /**
         * 当前能量值
         */
        public var energy:uint;

        /**
         * 最大能量值
         */
        public var maxEnergy:uint;

        /**
         * 每秒能量值恢复
         */
        public var energyRegen:uint;

        /**
         * 攻击力
         */
        public var pDamage:uint;

        /**
         * 防御力
         */
        public var defence:uint;

        /**
         * 暴击伤害百分比
         */
        public var criDam:uint;

        /**
         * 暴击抗性百分比
         */
        public var criDefence:uint;

        /**
         * 暴击伤害概率
         */
        public var criDamP:uint;

        /**
         * 生命吸取
         */
        public var suck:uint;

        /**
         * 伤害反弹
         */
        public var rebound:uint;

        /**
         * 战斗力
         */
        public var combat:uint;

        /**
         * 复活时间
         */
        public var reliveCD:uint;

        /**
         * 替换间隔
         */
        public var replaceCD:uint;

        /**
         * 技能CD变化(可正负)
         */
        public var skillCD:int;

        /**
         * 技能能量消耗变化
         */
        public var energyCost:int;

        /**
         * 当前经验
         */
        public var currentExp:uint;

        /**
         * 升级所需经验
         */
        public var maxExp:uint;

        /**
         * 出生技能
         */
        public var bornSkill:uint;

        /**
         * 唯一id
         */
        public var id:uint;

        /**
         * 状态 字节数组,按位设置（0出战 1训练）
         */
        public var state:uint;

        /**
         *  品质（1-5分别代表 白 绿蓝 紫 红）
         */
        public var quality:uint;

        /**
         * 额外攻击一次的概率（物理攻击触发）
         */
        public var extraAtkP:uint;

        /**
         * 百分比伤害减免
         */
        public var ignoreDamP:uint;

        /**
         * 伤害减免（值）
         */
        public var ignoreDam:uint;

        /**
         * 主动技能
         */
        public var attackSkillsList:Array /* of SkillInfo */;

        /**
         * 被动技能
         */
        public var passiveSkillsList:Array /* of SkillInfo */;

        /**
         * 道具获得时间
         */
        public var obtainTime:uint;

        /**
         * 截止时间
         */
        public var endTime:uint;

    }
}