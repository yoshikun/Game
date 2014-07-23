package com.yo.game.data.baseData
{
	public class ItemBaseData
	{
		/**
		 * 道具标识编号：
		 * 装备大类：1位
		   1=消耗品
		   2=装备
		   3=任务道具
		   4=
		   5=宝石
		   6=英雄卡片
		   7=战斗道具
		   8=其他类
         * 装备小类：2位（宝石的种类后期会扩充）
         * 装备类型：1位（只适用于武器，其他则为0）
		   1=短兵武器
		   2=长柄武器
		   3=远程武器
         共8位
		 */		
		public var baseID:int;
		
		/**
		 * 道具名称：
		 * 限14个字符
		 */		
		public var name:String;
		
		/**
		 * 装备描述：
		 * 限25个汉字（50个字符）
		 */		
		public var description:String;
		
		/**
		 * 道具所携带的凹槽，填写格式“a；b”a和b分别代表该道具携带的宝石凹槽与注魂凹槽的数量
		 */		
		public var hole:String;
		
		/**
		 * 道具类型：
		 * 1 代表战斗外使用的消耗品，如经验丹，铜币丹
		 * 2 代表装备
		 * 3 代表任务道具
		 * 4 
		 * 5 代表宝石与注魂
		 * 6 代表英雄卡片
		 * 7 代表战斗内可使用的消耗类道具
		 * 8 代表特殊类                   
		 * 9 代表技能对应的属性装备
		 */		
		public var itemClass:int;
		
		/**
		 * 	当大类为消耗品（1）时：
							01=喇叭
							02=收益类消耗品
							03=礼包
							04=家园种子
							05=复活道具
							06=装备碎片
							07=魔王钥匙
							08=功能道具
							09=宝箱类道具
							当大类为装备（2）时：
							01=武器
							02=头盔
							03=衣服
							04=饰品
							05=时装
							当大类为任务道具（3）时:
							当大类为战斗道具（4）时：
							当大类为宝石（5）时：
							01=普通宝石
							02=元素宝石
							当大类为英雄卡片（6）时：
							当大类为战斗道具（7）时：
							01=需要玩家装备使用
							02=掉落后拾取即可获得道具效果
							03=战斗道具，但是使用不会消耗，只会触发CD。
							当大类为特殊类（8）时：
							01=VIP卡
							02=特殊处理道具
							03=资源
		 */		
		public var itemType:int;
		
		/**
		 * 当itemclass为1，当itemType为（1）时：
				01=小喇叭
				02=大喇叭
				当itemclass为1，当itemType为（4）时：
				01=银币种子
				02=经验种子
				03=装备种子
				当itemclass为1，当itemType为（8）时：
				01=重铸石
				02=时装强化石
				03=祝福宝石
				04=贤者之石
				05=藏宝图
				06=女神之泪
				07=七彩石
				08=装备强化石
				09=装备重置石
				10=装备升星石
				当itemclass为2，当itemType为武器（1）时：
				01=短柄武器
				02=长柄武器
				03=远程武器
				当itemclass为2，当itemType为时装（5）时：
				01=增加幻影特效（只在站街上有效）
				02=增加幻影特效并提升站街移动30%（只在站街上有效）
				当itemclass为5，itemType为普通宝石时（1）时：
				01=攻击宝石
				02=防御宝石
				03=生命宝石
				04=暴击宝石
				05=韧性宝石
				06=能量宝石
				07=能量回复宝石
				当itemclass为7，itemType为（1）时：
				0=没限制
				01=回复生命
				02=回复能量
				当itemclass为5，itemType为元素宝石时（2）时：
				01=冰宝石
				02=火宝石
				03=雷宝石
				04=毒宝石
				05=风宝石
				06=光宝石
				07=暗宝石
				当itemclass为特殊类（8），itemType为特殊处理道具时（2）时：
				01=游戏币
				02=魂晶
		 */		
		public var subType:int;
		
		/**
		 * 1-5分别代表 白 绿蓝 紫 红
		 */		
		public var quality:int;
		
		/**
		 * 叠加数量：
		 * 限&gt;= 1的整数
		 * 1 表示不可以叠加
		 * 其他 表示叠加数量
		 */		
		public var maxNum:int;
		
		/**
		 * 道具放置与战斗道具栏位时最多能堆叠数
		 */		
		public var carryNum:int;
		
		/**
		 * 道具售价：
		 * 限整数
		 * 0 表示不可出售
		 * 其他表示具体售价
		 */		
		public var price:int;
		
		/**
		 * 道具有效期（单位：天）
		 */		
		public var validityTime:int;
		
		/**
		 * 道具交易属性：
		 * 0 不可交易
		 * 1 可以交易
		 */		
		public var exchange:int;
		
		/**
		 * 物品等级
		 */		
		public var level:int;
		
		/**
		 * 初始最大等级
		 */		
		public var startLevel:int;
		
		/**
		 * 最大等级
		 */		
		public var maxLevel:int;
		
		/**
		 * 需要等级
		 */		
		public var needLevel:int;
		
		/**
		 * 道具固定词缀的条目数量，当固定属性内填写的数目小于该值时，则填充随机词缀。读取随机词缀表内，set=2的值。
		 */		
		public var fixMaxNum:int;
		
		/**
		 * 道具固定属性：（时装，英雄装备，符文类装备）
		 */		
		public var fixEffect:String;
		
		/**
		 * 道具技能属性的上限个数
		 */		
		public var randMaxNum:int;
		
		/**
		 * 道具随机属性：其关联作用，关联到属性随机表
		 */		
		public var randEffect:String;
		
		/**
		 * 道具技能属性的上限个数，这个指的是装备词缀的技能
		 */		
		public var skillMaxNum:int;
		
		/**
		 * 装备技能(最多3个;分号隔开)
		 */		
		public var skill:String;
		
		/**
		 * 道具性别需求：
		 * 0 无性别需求
		 * 1 男性
		 * 2 女性
		 */		
		public var genderLimit:int;
		
		/**
		 * 道具职业需求（英雄装备）：
		 * 1 类别1
		 * 2 类别2
		 * 3 类别3
		 * 4 类别4
		 * 5 类别5
		 */		
		public var cliqueLimit:int;
		
		/**
		 * 图片ID
		 */		
		public var icon:int;
		
		/**
		 * 模型
		 */		
		public var sprite:int;
		
		/**
		 * 最小攻击力
		 */		
		public var pDamage:int;
		
		/**
		 * 防御力
		 */		
		public var defence:int;
		
		/**
		 * 最大血量
		 */		
		public var maxHP:int;
		
		/**
		 * 生命回复
		 */		
		public var resumeHP:int;
		
		/**
		 * 能否丢弃
		 */		
		public var canDrop:int;
		
		/**
		 * 药品效果 效果ID:效果值:有效时间（秒）：使用次数。如1天24小时内可使用10次双倍经验。有效时间（秒）为0，代表立即生效。
		 */		
		public var leechdom:String;
		
		/**
		 * 填写所需合成后道具的ID，无则填为0.
		 */		
		public var up:int;
		
		/**
		 * 填写合成所需此道具的数量，无则填为0.
		 */		
		public var needNum:int;
		
		/**
		 * 装备给玩家带来的攻击力百分比加成
		 */		
		public var pdPercent:int;
		
		/**
		 * 该物品是否可掉落
		 */		
		public var canDoff:int;
		
		/**
		 * 该物品是否可熔炼 1可熔炼 0不可
		 */		
		public var canFusion:int;
		
		/**
		 * 宝石可镶嵌的部位，若宝石支持镶嵌在不同的部件上，用“；“隔开
		 */		
		public var stoneType:String;
		
		/**
		 * tc字段的类型为String，规则形式为：tcid*tcid*tcid，该字段中的tcid可能为重复的
如：1101*1101*2309
这就意味着该宝箱会对tcid为1101的tc判定2次掉落，2309的tc一次
		 */		
		public var tc:String;
		
		/**
		 * 物品掉落时的音效
		 */		
		public var sound1:int;
		
		/**
		 * 物品拾取时的音效
		 */		
		public var sound2:int;
		
		/**
		 * 物品被使用时的音效
		 */		
		public var sound3:int;
		
		/**
		 * 种子培育所需时间，以分钟计时
		 */		
		public var growTime:int;
		
		/**
		 * 种子培育获得的收益，填写具体的数值。根据subType去判断种子类型。当为1时，表示产出的银币量。当为2时，表示产出的经验值。当为3时，表示具体的tc的id。根据tc随机出相应的装备。
		 */		
		public var growGain:int;
		
		public function copyTo(result:Object):void{
			result.baseID = this.baseID;
			result.name = this.name;
			result.description = this.description;
			result.hole = this.hole;
			result.itemClass = this.itemClass;
			result.itemType = this.itemType;
			result.subType = this.subType;
			result.quality = this.quality;
			result.maxNum = this.maxNum;
			result.carryNum = this.carryNum;
			result.price = this.price;
			result.validityTime = this.validityTime;
			result.exchange = this.exchange;
			result.level = this.level;
			result.startLevel = this.startLevel;
			result.maxLevel = this.maxLevel;
			result.needLevel = this.needLevel;
			result.fixMaxNum = this.fixMaxNum;
			result.fixEffect = this.fixEffect;
			result.randMaxNum = this.randMaxNum;
			result.randEffect = this.randEffect;
			result.skillMaxNum = this.skillMaxNum;
			result.skill = this.skill;
			result.genderLimit = this.genderLimit;
			result.cliqueLimit = this.cliqueLimit;
			result.icon = this.icon;
			result.sprite = this.sprite;
			result.pDamage = this.pDamage;
			result.defence = this.defence;
			result.maxHP = this.maxHP;
			result.resumeHP = this.resumeHP;
			result.canDrop = this.canDrop;
			result.leechdom = this.leechdom;
			result.up = this.up;
			result.needNum = this.needNum;
			result.pdPercent = this.pdPercent;
			result.canDoff = this.canDoff;
			result.canFusion = this.canFusion;
			result.stoneType = this.stoneType;
			result.tc = this.tc;
			result.sound1 = this.sound1;
			result.sound2 = this.sound2;
			result.sound3 = this.sound3;
			result.growTime = this.growTime;
			result.growGain = this.growGain;
			}
	}
}