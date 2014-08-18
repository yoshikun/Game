package com.yile.games.doll.object
{
	import com.yo.framework.objects.MovingEntity;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.GlowFilter;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.utils.Dictionary;
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;
	
	public class GameEntity extends MovingEntity
	{
		/**
		 * 血条
		 */
		protected var _healthBar:HealthBar;
		
		protected var _vo:EntityVo;
		
		/**
		 * 施法效果 
		 */		
		protected var _castingEffect:EntityEffect;
		
		/**
		 * 受击目标 
		 */		
		protected var _hitTarget:DollEntity;
		
		/**
		 * 受击点，投掷技能，useType=64会设置这个点 
		 */		
		public var hitPoint:Point;
		
		protected var _skillVo:SkillBaseData;
		
		// 状态
		protected var _displayEffects:Dictionary = new Dictionary();
		
		protected var _hurtTimer:uint = 0;
		protected var _hurtColorTimer:uint;
		
		protected var _attacking:Boolean;
		
		private var _log:Log;
		
		// 用来平滑网络延迟影响
		public var positionModifier:Vector3D = new Vector3D();
		
		public var smooth:Boolean = false;
		
		public var positionSmoothFactor:Number = 0.075;
		
		/**
		 * 持续的闪电效果 
		 */		
		protected var _lightningEntity:LightningEntity;
		
		protected var _isDead:Boolean = false;
		
		protected var _attackable:Boolean = true;
		
		protected var _isCasting:Boolean = false;
		
		/**
		 * 被噬魂的怪 
		 */		
		protected var _defender:BaseEntity;
		
		/**
		 * 聊天泡泡 
		 */		
		private var _talk:TalkPop;
		
		/**
		 * 当前状态类表 
		 */		
		private var _states:Object = {};
		private var _effects:Dictionary = new Dictionary();
		
		/**
		 * 是否在播放攻击动画 
		 */		
		private var _playAttack:Boolean = false;
		
		private var _phantomFilter:PhantomFilter;
		
		private var _pathFilter:PathFilter;
		
		/**
		 * 请求攻击包中 
		 */		
		public var requestAttacking:Boolean = false;
		
		
		/**
		 * 持续施法中 
		 */		
		public var isChannel:Boolean = false;
		
		/**
		 * 怪物名字 
		 */		
		protected var _enemyTitle:EnemyTitle;
		private var _emotion:Emotion;
		
		private var _stoneIndex:Array;
		private var _coldIndex:Array;
		private var _leaderIndex:Array;
		private var _poisonIndex:Array;
		private var _angryIndex:Array;
		
		private var _invisibleID:TweenLite;
		private var _forceAttackClearID:uint;
		
		protected var _normalSkill:int;
		
		protected var _isShowAvatar:Boolean = true;
		
		public function DollEntity(gs:GameScene, vo:EntityVo)
		{
			_vo = vo;
			_log = Log.getLog(this);
			addEventListener(EntityEvent.HIT, onHit);
			super(gs);
		}
		
		public function get normalSkill():int
		{
			return _normalSkill;
		}
		
		public function set normalSkill(value:int):void
		{
			_normalSkill = value;
		}
		
		public function resetNormalSkill():void {
			
		}
		
		/**
		 * 获取动画的目标点 
		 */		
		public function getPoint(flip:Boolean = false, posName:String = "head"):Point {
			if(!animator){
				return new Point(0, 0);
			}
			return animator.getPoint(flip, posName);
		}
		
		public function attack(name:String, canCancel:Boolean, canOverride:Boolean = true):void{
			if (moving) {
				return;
			}
			if (! name) {
				return;
			}
			
			// 清理受击延迟
			// 否则会播放受击动画
			if(_hurtTimer){
				clearTimeout(_hurtTimer);
				_hurtTimer = 0;
			}
			
			var ret:int;
			if (canOverride) {
				// 就算是同一个动画，也覆盖
				if (animator.currentAnimation && animator.currentAnimation.name == name) {
					animator.currentAnimation.removeAllEventListener();
					animator.currentAnimation.reset();
					ret = BaseAnimator.PLAY_RET_SUCCESS;
				} else {
					ret = animator.play(name);
				}
			} else {
				ret = play(name);
			}
			
			// 是否无法被移动中断
			// 则设置攻击中标示符
			//			if (! canCancel && 
			//				ret == BaseAnimator.PLAY_RET_SUCCESS) {
			if (! canCancel) {
				_attacking = true;
			}
			
			// 设定正在播放攻击动画标示符
			_playAttack = true;
			
			if(ret == BaseAnimator.PLAY_RET_UNLOADED) {
				// 如果还未初始化，比如位图动画，按动作加载
				_animator.addEventListener(AnimationEvent.INIT, _onInit);
			}else if (ret == BaseAnimator.PLAY_RET_UNEXIST) {
				// 如果动画不存在
				_onIdle(null);
			}else if (ret == BaseAnimator.PLAY_RET_SUCCESS) {
				// 如果播放成功
				_onInit(null);
			}else {
				_onIdle(null);
			}
		}
		
		private function _onInit(e:AnimationEvent):void
		{
			// 移除监听
			_animator.removeEventListener(AnimationEvent.INIT, _onInit);
			
			// 播放完成后
			_animator.addEventListener(AnimationEvent.COMPLETE, _onIdle);
		}
		
		public function jump(target:Point, time:uint):void{
			_jumpTarget = target;
			_jumpTime = time;
			
			_animator.currentAnimation.removeAllEventListener();
			clearMovement();
			
			_jumping = true;
			play("jump_start");
			_animator.addEventListener(AnimationEvent.COMPLETE, __jumpComplete);
		}
		
		protected function __jumpComplete(e:Event):void
		{
			_animator.removeEventListener(AnimationEvent.COMPLETE, arguments.callee);
			
			_animator.play("jump");
			var len:Number = Vector3DUtil.dist(position, new Vector3D(_jumpTarget.x, _jumpTarget.y, 0));
			var kspeed:Number = 1000 * len / _jumpTime;
			_movement = new JumpMovement(this, _jumpTarget, kspeed, _jumpTime / 1000);
			_movement.addEventListener(MovementEvent.ARRIVED, __arrived);
		}
		
		protected function __arrived(e:Event):void
		{
			_movement.removeEventListener(MovementEvent.ARRIVED, arguments.callee);
			_animator.play("jump_end");
			onArrived(null);
		}
		
		protected function _onIdle(e:Event):void 
		{
			clearTimeout(_forceAttackClearID);
			_attacking = false;
			_playAttack = false;
			
			if(_animator){
				_animator.removeEventListener(AnimationEvent.COMPLETE, _onIdle);
				_animator.play("idle");
			}
		}
		
		override public function move(angle:Number, isForce:Boolean=false):void{
			if(! _movable){
				return;
			}
			if (isDead) {
				return;
			}
			super.move(angle);
			// 持续施法技能想要边走边放
			if(_animator && ! isChannel){
				_animator.play("walk");
			}
		}
		
		override public function stop(isClearMovement:Boolean = true):void{
			super.stop(isClearMovement);
			if(! moving 
				&& _animator 
				&& _animator.currentAnimation 
				&& _animator.currentAnimation.name == "walk"){
				_animator.play("idle");
			}
		}
		
		public function get vo():EntityVo
		{
			return _vo;
		}
		
		public function set vo(value:EntityVo):void
		{
			_vo = value;
		}
		
		/**
		 * 设置血量 
		 */        
		public function setHp(hp:uint, byLuck:Boolean, isShow:Boolean = true):void{
			var delta:int = _vo.hp - hp;
			_vo.hp = Math.min(hp, _vo.maxHP);
			// 简单伤害动画
			if(Math.abs(delta) > 0 && _healthBar){
				_healthBar.setHurt(delta, byLuck, isShow);
			}
		}
		
		/**
		 * 设置能量 
		 */        
		public function setEnergy(mp:uint, byLuck:Boolean):void{
			if (! _healthBar) {
				return;
			}
			var delta:int = _vo.energy - mp;
			_vo.energy = Math.min(mp, _vo.maxEnergy);
			if(Math.abs(delta) > 0){
				_healthBar.setEnergy(delta, byLuck);
			}
		}
		
		/**
		 * 开始施法读条
		 */        
		public function startCast(name:uint, act:int):void{
			if(name){
				_castingEffect = new EntityEffect(name, this, gs, false);
			}
			var animName:String = actIdToAct(act);
			if (animName) {
				// 清理受击动画
				if(_hurtTimer){
					clearTimeout(_hurtTimer);
					_hurtTimer = 0;
				}
				animator.play(animName);
			}
			_isCasting = true;
		}
		
		/**
		 * 停止施法动画
		 */        
		public function stopCast(isPlayIdle:Boolean = true):void {
			if(_castingEffect){
				_castingEffect.dispose();
				_castingEffect = null;
			}
			_isCasting = false;
			if (animator && isPlayIdle) {
				animator.play("idle");
			}
		}
		/**
		 * 停止持续施法 
		 * 
		 */		
		public function stopChannel():void {
			isChannel = false;
			if (animator) {
				animator.play("idle");
			}
		}
		
		/**
		 * 对防御方的持续效果
		 */		
		public function continueCast(defender:BaseEntity):void{
			_defender = defender;
			if(!_lightningEntity){
				_lightningEntity = new LightningEntity(ZOrder.ABOVE_OBJECT, this, defender);
			}else{
				_lightningEntity.defender = defender;
			}
			_lightningEntity.visible = true;
			SoundManager.instance.play("310002", false, true, int.MAX_VALUE);
		}
		
		public function stopContinueCast():void{
			if(_lightningEntity){
				_defender = null;
				_lightningEntity.visible = false;
				_animator.play("idle");
				stopCast();
			}
			SoundManager.instance.stop("310002");
		}
		
		/**
		 * 主动普通攻击请求 
		 * 
		 */		
		public function attackStart(t:DollEntity, skillID:int = 1):void {
			var skill:SkillBaseData = SkillCacheManager.instance.getDataById(skillID);
			if(!skill){
				return;
			}
			// 如果技能有施法动画，则怪物停止
			if(skill.act1 != '0' ||
				skill.act2 != '0' ||
				skill.act3 != '0'){
				stop();
			}
			
			var r:MagicAttackStartRequest = new MagicAttackStartRequest();
			r.id = vo.tempID;
			if(t is Player) {
				if (this is Player) {
					r.attackType = 0;
				} else {
					r.attackType = 2;
				}
			}else{
				if (this is Player) {
					r.attackType = 1;
				} else {
					r.attackType = 3;
				}
			}
			r.defenceID = t.vo.tempID;
			r.skillID = skillID;
			r.direct = Transfer.direct(MathUtil.toDegrees(getAngle(new Point(t.position.x, t.position.y))));
			NetworkManager.client.send(r);
			
//			requestAttacking = true;
		}
		
		protected function getActEffect(skillVo:SkillBaseData):int {
			return skillVo['actEffect1'];
		}
		
		/**
		 * 技能释放 
		 */        
		public function perform(skillVo:SkillBaseData, target:DollEntity):void{
			// 播放施法特效
			var actEffect:int = getActEffect(skillVo);
			if(actEffect){
				new EntityEffect(actEffect, this, gs);
			}
			// 本身的区域特效
			var actAreaEffect:int = skillVo.actAreaEffect;
			if (actAreaEffect && _isShowAvatar) {
				var s:RenderState = getRenderState();
				var pos:Point = getPoint(flip, "gravity");
				pos.x += s.x;
				pos.y += s.y;
				pos.x = gs.transfer.getWorldX(pos.x);
				pos.y = gs.transfer.getWorldY(pos.y);
				var e:Effect = new Effect(actAreaEffect, gs, pos);
				e.direction = direction;
			}
			
			// 获取当前动画名称
			var actNames:Array = getActNames(skillVo);
			var actName:String = actIdToAct(actNames[int(actNames.length * Math.random())]);
			
			// 如果之前的攻击还没播放结束
			// 且当前的技能优先级小于之前优先级
			if (_playAttack &&
				_skillVo && 
				skillVo.priority < _skillVo.priority) {
				_log.info("当前的技能攻击", skillVo.baseID, "优先级小于之前技能攻击", _skillVo.baseID ,"优先级，动画未播放");
				return;
			}
			
			// 攻击目标
			_hitTarget = target;
			_skillVo = skillVo;
			
			// 是否可以被移动中断
			var canCancel:Boolean = Boolean(skillVo.canCancel);
			
			// 如果不可被中断
			if (! canCancel) {
				stop();
			}
			
			playPorformSound();
			
			attack(actName, canCancel);
		}
		
		protected function getSound(skillVo:SkillBaseData):String {
			return skillVo['sound1'];
		}
		
		// 播放释放音效
		protected function playPorformSound():void {
			var sound:String = getSound(_skillVo);
			// 播放攻击音效
			if (sound != '0') {
				SoundManager.instance.play(MathUtil.getRandomElementOf(sound.split(";")));
			}
		}
		
		//		private function isSkillAttack(vo:SkillBaseData):Boolean {
		//			return (vo.baseID != NormalSkill.NPC && vo.baseID != NormalSkill.PLAYER);
		//		}
		
		protected function getActNames(vo:SkillBaseData):Array{
			return vo.act1.split(";");
		}
		
		public function getFlyEffect(skillVo:SkillBaseData):int {
			return skillVo.flyEffect1;
		}
		
		protected function actIdToAct(act:int):String{
			var config:Object ={
				1: "idle",
				2: "walk",
				3: "attack",
				4: "attack1",
				5: "attack2",
				6: "cast1",
				7: "cast2",
				8: "idle2",
				9: "appear",
				10: "jump_start",
				11: "jump",
				12: "jump_end",
				13: "hurt",
				28: "dead"
			};
			return config[act];
		}
		
		
		/**
		 * 发射投射物 
		 */        
		public function shoot(target:DollEntity, speed:Number, data:SkillBaseData, hitPoint:Point):void{
			if(_isShowAvatar) {
				EntityFactory.instance.createProjectile(gs, this, target, data, speed, getFlyEffect(data).toString(), hitPoint);
			}
		}
		
		/**
		 * 是否在攻击范围 
		 */		
		public function inAttackRange(target:DollEntity, range:Number = 0):Boolean{
			//			// 判断X轴是否在攻击距离
			//			if(target.vo.width + vo.attackRange + vo.width < Math.abs(target.position.x - position.x)){
			//				return false;
			//			}
			//			// 判断Y轴是否在攻击距离
			//			if(target.vo.height + vo.attackRange + vo.height < Math.abs(target.position.y - position.y)){
			//				return false;
			//			}
			//			return true;
			if(range <= 0) {
				range = vo.attackRange;
			}
			
			range += vo.radius + target.vo.radius;
			// 变小一下攻击范围
			range -= 32;
			
			return position.subtract(target.position).lengthSquared < range * range;	
		}
		
		/**
		 * 是否可以主动移动 
		 */		
		public function canMove():Boolean {
			var unableMoveEffect:Boolean = false;
			for each (var eId:int in SpecialEffect.UNABLE_MOVE_EFFECTS) {
				if (hasEffect(eId)) {
					unableMoveEffect = true;
					break;
				}
			}
			return ! attacking && ! jumping && ! knockbacking && ! unableMoveEffect;
		}
		
		/**
		 * 是否可以使用技能 
		 */		
		public function canUseSkill():Boolean {
			var unableSkillEffect:Boolean = false;
			for each (var eId:int in SpecialEffect.UNABLE_SKILL_EFFECTS) {
				if (hasEffect(eId)) {
					unableSkillEffect = true;
					break;
				}
			}
			return !unableSkillEffect;
		}
		
		/**
		 * 是否可以主动攻击 
		 */		
		public function canAttack():Boolean {
			return attackable && ! jumping && ! knockbacking && ! isCasting;
		}
		
		
		/**
		 * 判断这个目标是否可被攻击 
		 */		
		public function canAttackTarget(entity:DollEntity):Boolean {
			return ! ((entity == this) || 
				(entity.vo.team == vo.team) ||
				(entity.vo.entityType != EntityType.NPC && entity.vo.entityType != EntityType.PLAYER) ||
				(! entity.vo.canBeAttack) ||
				hasEffect(SpecialEffect.UNABLE_SELECTED) ||
				(entity.vo.isHide) ||
				(entity.isDead) ||
				(entity.hasEffect(SpecialEffect.INVISIBLE_EFFECT)));
		}
		
		/**
		 * 增加增益减益 
		 */        
		public function addBuff(state:uint):void{
			var stateBase:StateBaseData = StateCacheManager.instance.getStateById(state);
			if(! stateBase){
				_log.warn("状态ID", state, "不存在");
				return;
			}
			
			if (stateBase.showEffect != '0') {
				new EntityEffect(uint(stateBase.showEffect), this, gs);
			}
			if (stateBase.effects == "0") {
				return;
			}
			
			// 存状态
			_states[stateBase.baseID] = stateBase;
			
			// 持续效果
			addEffect(stateBase.effects);
			
			// 增加另外一种效果效果
			addEffect(stateBase.effect, true);	
			
			
			// 显示效果
			var r:SpriteRenderer = _renderer as SpriteRenderer;
			if (r) {
				switch(stateBase.displayEffect)
				{
					case DisplayEffect.GRAY:
					{
						_log.info("增加显示特效，石化");
						_stoneIndex = r.addFilter(ColorEffect.gray);
						break;
					}
						
					case DisplayEffect.PHANTOM:
					{
						_log.info("增加显示特效，幻影");
						addPhantom();
						break;
					}
						
					case DisplayEffect.POISON:
					{
						_log.info("增加显示特效，中毒");
						_poisonIndex = r.addFilter(ColorEffect.poison);
						break;
					}
						
					case DisplayEffect.COLD:
					{
						_log.info("增加显示特效，冷冻");
						_coldIndex = r.addFilter(ColorEffect.cold);
						break;
					}
						
					case DisplayEffect.SPIRIT_LEADER:
					{
						_log.info("增加显示特效，精神领袖");
						_leaderIndex = r.addFilter(new GlowFilter(0xFF3300, 1.0, 5, 5, 1));
						break;
					}
					case DisplayEffect.ANGRY:
					{
						_log.info("增加显示特效，狂暴");
						_angryIndex = r.addFilter(ColorEffect.angry);
						break;
					}
					default:
					{
						break;
					}
				}
			}
		}
		
		/**
		 * 增加效果 
		 * @param effect
		 * 
		 */		
		private function addEffect(effect:String, isDown:Boolean = false):void
		{
			if (! effect || effect == "0") {
				return;
			}

			var effectArr:Array = effect.split(";");
			var len:int = effectArr.length;
			for (var i:int = 0; i < len; i++) 
			{
				var effectArray:Array = effectArr[i].toString().split("*");
				var displayId:uint = parseInt(effectArray[2]);
				var effectId:uint = parseInt(effectArray[0]);
				
				// 增加字典，为了快速查询
				_effects[effectId] = effectId;
				
				// 眩晕播放待机动画
				if (effectId == SpecialEffect.STUN_EFFECT) {
					if (! hasDisplayEffect(DisplayEffect.GRAY)) {
						_animator.play("idle");
					}
				}
				
				
				// 石化攻击帧停止
				if (effectId == SpecialEffect.STONE_EFFECT) {
					_animator.currentAnimation.stop();
				}
				
				// 定身效果无法移动
				if(-1 != SpecialEffect.UNABLE_MOVE_EFFECTS.indexOf(effectId)){
					// 如果不在击退过程中，停止
					if (! knockbacking) {
						_log.info("增加定身效果", vo.name);
						stop();
					}
					// 如果是玩家的话，清理目标
					if (this is Player) {
						Player(this).clearTarget();
					}
				}
				
				// 隐身
				if(effectId == SpecialEffect.INVISIBLE_EFFECT){
					if(vo.team == PathFinderScene(gs).player.vo.team){
						Sprite(renderer).alpha = 0.4;
					}else{
						_invisibleID = TweenLite.to(renderer, 0.5,{"alpha": 0, "onComplete": function():void{
							visible = false;
						}});
					}
					// 如果是玩家的话，清理目标
					if (this is Player) {
						Player(this).clearTarget();
					}
					_log.info(vo.name, "进入隐身状态");
					dispatchEvent(new EntityEvent(EntityEvent.INVISIBLE));
				}
				// 沉默，眩晕
				if(-1 != SpecialEffect.UNABLE_SKILL_EFFECTS.indexOf(effectId)){
					if(vo.tempID == PlayerModel.instance.self.tempID){
						_log.info("增加无法使用技能效果");
						GlobalEventDispatcher.dispatchEvent(GlobalEvent.BATTLE_SKILL_ENABLED, [EntityType.PLAYER, false]);
					}else if(vo.type == NPCType.HERO && vo.masterID == PlayerModel.instance.self.tempID){
						GlobalEventDispatcher.dispatchEvent(GlobalEvent.BATTLE_SKILL_ENABLED, [EntityType.NPC, false]);
					}
				}
				
				// 无法攻击的效果
				if (-1 != SpecialEffect.UNABLE_ATTACK_EFFECT.indexOf(effectId)) {
					_log.info("增加无法使用攻击效果");
					_attackable = false;
				}
				
				// 隐身
				if (effectId == SpecialEffect.UNABLE_SELECTED) {
					// 如果是玩家的目标话，清理目标
					if (FightScene(gs).player.attackTarget == this) {
						FightScene(gs).player.clearTarget();
					}
					FightScene(gs).clearOverEffect();
				}
				
				// 修改视野
				if (effectId == SpecialEffect.FOV) {
					if (vo.tempID == PlayerModel.instance.self.tempID) {
						PathFinderScene(gs).showWarFog();
					}
				}
				
				// 升高
				if (effectId == SpecialEffect.Z_EFFECT) {
					var height:uint = parseInt(effectArray[3]);
					_log.info("升起", vo.name, height);
					if (isDown) {
						TweenLite.to(this, GlobalConfig.config.flyDropTime / 500, {"z":-height, ease:Sine.easeOut, onComplete:flyDropTimeComplete});
					} else {
						TweenLite.to(this, GlobalConfig.config.flyDropTime / 500, {"z":-height, ease:Sine.easeOut});
					}
				}
				
				if (! displayId) { 
					continue;
				}
				if (_displayEffects[displayId]) {
					continue;
				}
				_displayEffects[displayId] = new EntityEffect(displayId, this, gs, false);
			}
		}
		
		private function flyDropTimeComplete():void{
			TweenLite.to(this, GlobalConfig.config.flyDropTime / 1000, {"z":0, ease:Cubic.easeIn});
		}
		
		/**
		 * 判断是否有某种效果 
		 */		
		public function hasEffect(eId:uint):Boolean {
			return _effects[eId];
		}
		
		/**
		 * 判断是否有某种显示效果 
		 */		
		public function hasDisplayEffect(eId:uint):Boolean {
			for each (var state:StateBaseData in _states) {
				if (state.displayEffect == eId) {
					return true;
				}
			}
			return false;
		}
		
		/**
		 * 取出增益减益
		 */        
		public function removeBuff(state:uint):void{
			var stateBase:StateBaseData = StateCacheManager.instance.getStateById(state);
			if(! stateBase || stateBase.effects == "0"){
				return;
			}
			
			delete _states[stateBase.baseID];
			var effects:Array = stateBase.effects.split(";");
			for each(var effect:String in effects) {
				var effectArray:Array = effect.split("*");
				var displayId:uint = parseInt(effectArray[2]);
				var effectId:uint = parseInt(effectArray[0]);
				
				delete _effects[effectId];
				
				// 定身效果无法移动
				if(-1 != SpecialEffect.UNABLE_MOVE_EFFECTS.indexOf(effectId)){
				}
				
				if (effectId == SpecialEffect.STONE_EFFECT) {
					_animator.currentAnimation.resume();
				}
				
				// 恐惧
				if (effectId == SpecialEffect.DREADER_EFFECT) {
					if (vo.tempID == PlayerModel.instance.self.tempID) {
						stop();
						deadReckoning && deadReckoning.updateState(true);
					}
				}
				
				// 修改z轴
				if (effectId == SpecialEffect.Z_EFFECT) {
					//					position.z = 0;
					_log.info("降落", vo.name, 0);
					TweenLite.to(this, GlobalConfig.config.flyDropTime / 1000, {"z": 0, ease:Cubic.easeIn});
				}
				
				// 隐身
				if (effectId == SpecialEffect.INVISIBLE_EFFECT) {
					if (_invisibleID) {
						_invisibleID.kill();
						_invisibleID = null;
					}
					if(vo.team == PathFinderScene(gs).player.vo.team){
						Sprite(renderer).alpha = 1;
					} else{
						visible = true;
						Sprite(renderer).alpha = 1;
					}
					_log.info(vo.name, "退出隐身状态");
				}
				// 沉默，眩晕
				if (-1 != SpecialEffect.UNABLE_SKILL_EFFECTS.indexOf(effectId)) {
					if(canUseSkill()) {
						if(vo.tempID == PlayerModel.instance.self.tempID){
							GlobalEventDispatcher.dispatchEvent(GlobalEvent.BATTLE_SKILL_ENABLED, [EntityType.PLAYER, true]);
						}else if(!_isDead && vo.type == NPCType.HERO && vo.masterID == PlayerModel.instance.self.tempID){
							GlobalEventDispatcher.dispatchEvent(GlobalEvent.BATTLE_SKILL_ENABLED, [EntityType.NPC, true]);
						}
					}
				}
				
				// 无法攻击的效果
				if (-1 != SpecialEffect.UNABLE_ATTACK_EFFECT.indexOf(effectId)) {
					_attackable = true;
				}
				
				// 修改视野
				if (effectId == SpecialEffect.FOV) {
					if (vo.tempID == PlayerModel.instance.self.tempID) {
						PathFinderScene(gs).hideWarFog();
					}
				}
				
				removeEffect(displayId);
			}
			
			// 显示效果
			var r:SpriteRenderer = _renderer as SpriteRenderer;
			if (r) {
				switch(stateBase.displayEffect)
				{
					case DisplayEffect.GRAY:
					{
						r.rmFilter(_stoneIndex);
						break;
					}
						
					case DisplayEffect.PHANTOM:
					{
						removePhantom();
						break;
					}
						
					case DisplayEffect.POISON:
					{
						r.rmFilter(_poisonIndex);
						break;
					}
						
					case DisplayEffect.COLD:
					{
						r.rmFilter(_coldIndex);
						break;
					}
						
					case DisplayEffect.SPIRIT_LEADER:
					{
						r.rmFilter(_leaderIndex);
						break;
					}
						
					case DisplayEffect.ANGRY:
					{
						r.rmFilter(_angryIndex);
						break;
					}
						
					default:
					{
						break;
					}
				}
			}
		}
		
		/**
		 * 移除效果 
		 */        
		protected function removeEffect(effectId:uint):void{
			var entityEffect:EntityEffect = _displayEffects[effectId] as EntityEffect;
			if(entityEffect){
				entityEffect.dispose();
			}
			delete _displayEffects[effectId];
		}
		
		
		override public function update():void{
			// 如果处于攻击点，目标受击特效
			if(((_hitTarget && _hitTarget != this && ! _hitTarget.isDisposed) || hitPoint)
				&& animator && animator.currentAnimation && animator.currentAnimation.inited) {
				if ((animator.currentAnimation.currentFrameIndex + 1) >= (animator.currentAnimation.info.attack)) {
					var isShoot:Boolean = false;
					
					// 如果有投射物
					if (getFlyEffect(_skillVo)) {
						isShoot = true; 
					}
					
					if (isShoot) {
						if (_skillVo.flySpeed <= 0) {
							_log.warn("投射物速度错误");
						} else {
							_log.info("发射投射物", _skillVo.flySpeed, getFlyEffect(_skillVo));
							if(hitPoint || (_hitTarget && !_hitTarget.isDisposed)){
								shoot(_hitTarget, gs.transfer.speed(_skillVo.flySpeed), _skillVo, hitPoint);
							}
						}
					}
					_hitTarget = null;
					hitPoint = null;
				}
			}
			
			//持续施法的时候始终朝向怪
			if(_isCasting && _defender){
				faceTo(_defender);
			}
			
			// 更新位置修正值
			if (smooth) {
				positionModifier.scaleBy(1 - positionSmoothFactor);
			}
			super.update();
		}
		
		/**
		 * 受击事件 
		 */		
		protected function onHit(e:EntityEvent):void
		{			
			var skillVo:SkillBaseData = e.data as SkillBaseData;
			
			if(vo.entityType == EntityType.PLAYER){
				SoundManager.instance.play("Battle_PlayerUnderAttack_101");
			} else {
				// 受击音效
				if(vo.type == NPCType.BASE){
					//					SoundManager.instance.play("Battle_CrystalUnderAttack_01");
				}else if(vo.type == NPCType.PET){
					//					SoundManager.instance.play(MathUtil.getRandomElementOf(["Battle_MonsterUnderAttack_101", "Battle_MonsterUnderAttack_102", "Battle_MonsterUnderAttack_103"]));
				}else if(vo.type == NPCType.HERO){
					SoundManager.instance.play(MathUtil.getRandomElementOf(["Battle_HeroUnderAttack_101"]));
					
					if(vo.masterID == PlayerModel.instance.self.tempID){
						//英雄受伤
						GlobalEventDispatcher.dispatchEvent(GlobalEvent.HERO_HIT, vo.baseID);
					}
				}
			}
			
			// 无敌的受击特效
			if (hasEffect(SpecialEffect.INVINCIBLE)) {
				new EntityEffect(5009, this, gs);
			} 
				
				// 击中特效
			else if(skillVo.hitEffect){
				hurtEffect(skillVo.hitEffect);
			}
		}
		
		/**
		 * 死亡 
		 */		
		public function dead():void{
			if (vo.masterID == PlayerModel.instance.self.tempID &&
				vo.type == NPCType.HERO){
				GlobalEventDispatcher.dispatchEvent(GlobalEvent.NPC_DEATH_NOTIFY, vo.baseID);
			}
			
			_isDead = true;
			
			if (vo.deadEffect != 0) {
				if(_isShowAvatar) {
					new Effect(vo.deadEffect, gs, new Point(x, y));
				}
			}
			
			if (vo.type == NPCType.PET) {
				SoundManager.instance.play(MathUtil.getRandomElementOf(["Battle_MonsterDeath_101", 
					"Battle_MonsterDeath_201"]));
			}
			if (vo.type == NPCType.HERO) {
				SoundManager.instance.play(MathUtil.getRandomElementOf(["Battle_HeroDeath_101", 
					"Battle_HeroDeath_201"]));
			}
			
			removeAllEffect();
			
			stopContinueCast();
			
			stop();
			
			if (vo.deadAct == 1 || this is Player) {
				animator.play('dead');
			} else {
				renderer.visible = false;
			}
			
			if (healthBar) {
				healthBar.visible = false;
			}
			
			if (_enemyTitle) {
				_enemyTitle.visible = false;
			}
			renderer.mouseEnabled = false;
			
			// 闪烁特效后渐变
			//			new BlinkFilter(this, 200, 0.4, 400, function():void {
			//				TweenLite.to(renderer, 0.6, {alpha: 0});
			//			});
			//			var colorTransform:ColorTransform = ColorEffect.tintPerc(new ColorArgb(255.0, 255.0, 255.0), 1.0); 
			//			SpriteRenderer(renderer).transform.colorTransform = colorTransform;
			//			setTimeout(function():void {
			//			}, 600);
			dispatchEvent(new EntityEvent(EntityEvent.DEAD, this));
		}
		
		public function relive():void {
			_isDead = false;
			
			if (vo.deadAct == 1 || this is Player) {
				animator.play('idle');
			} else {
				renderer.visible = true;
			}
			
			if (healthBar) {
				healthBar.visible = true;
			}
			
			if (_enemyTitle) {
				_enemyTitle.visible = true;
			}
			renderer.mouseEnabled = true;
		}
		
		public function removeAllEffect():void {
			for(var effectId:String in _displayEffects){
				removeEffect(int(effectId));
			}
			if(_hurtTimer){
				clearTimeout(_hurtTimer);
				_hurtTimer = 0;
				onHurtResume();
			}
			if(_hurtColorTimer){
				clearTimeout(_hurtColorTimer);
				onColorResume();
			}
			stopAttack();
		}
		
		public function stopAttack():void
		{
			stopCast();
			_attacking = false;
			_playAttack = false;
		}
		
		/**
		 * 击中特效 
		 */        
		public function hurtEffect(effect:uint):void{
			if (_hurtColorTimer) {
				onColorResume();
				clearTimeout(_hurtColorTimer);
			}
			
			if (DisplayObject(renderer).filters.length <= 0) {
				Misc.addFilter(renderer as DisplayObject, ColorEffect.tint(1.5, 1.5, 1.5));
				_hurtColorTimer = setTimeout(onColorResume, 100);
			}
			
			//怪物用hurtAct字段控制是否有动画
			var canPlayHurt:Boolean = true;
			var npc:NpcBaseData = NpcCacheManager.instance.getNpcById(_vo.baseID);
			if(npc){
				canPlayHurt = Boolean(npc.hurtAct);
			}
			// 如果有石化效果，不应该播放受击
			if (!hasEffect(SpecialEffect.STONE_EFFECT) && canPlayHurt) {
				var ret:int = play("hurt");
				if ((ret == BaseAnimator.PLAY_RET_SUCCESS ||
					ret == BaseAnimator.PLAY_RET_UNLOADED || 
					ret == BaseAnimator.PLAY_RET_UNEXIST) && ! _hurtTimer) {
					_hurtTimer = setTimeout(onHurtResume, 200);
				}
			}
			
			var s:RenderState = getRenderState();
			var pos:Point = getPoint(flip, "body");
			pos.x += s.x;
			pos.y += s.y;
			pos.x = gs.transfer.getWorldX(pos.x);
			pos.y = gs.transfer.getWorldY(pos.y);
			var e:Effect = new Effect(effect, gs, pos);
			e.direction = direction;
			
		}
		
		public function play(animName:String):int {
			//如果没有攻击动画,获取攻击动画优先级大于当前攻击动画，则播放
			//当前动画优先级
			var currentPriority:int = animationPriority.indexOf(_animator.currentAnimationName);
			//即将播放动画优先级
			var nextPriority:int = animationPriority.indexOf(animName);
			if (! _animator.currentAnimation || nextPriority < currentPriority){
				_log.info("播放动画", animName, _animator.currentAnimationName);
				// 清理受击动画
				if(_hurtTimer){
					clearTimeout(_hurtTimer);
					_hurtTimer = 0;
				}
				return _animator.play(animName);
			} else {
				_log.info(_animator.currentAnimationName, "播放优先级大于", animName, "播放失败");
			}
			return BaseAnimator.PLAY_RET_OTHER;
		}
		
		/**
		 * 获取动画优先级，数组越小优先越高 
		 */		
		protected function get animationPriority():Array {
			return ["attack2", "attack1", "attack", "cast2", "cast1", "hurt", "idle"];
		}
		
		protected function onColorResume():void
		{
			CONFIG::cpu{
				if(renderer){
					DisplayObject(renderer).filters = [];
				}
				_hurtColorTimer = 0;
			}
		}    
		
		protected function onHurtResume():void
		{
			_animator.play("idle");
			_hurtTimer = 0;
		}        
		
		override public function get x():Number{
			if(smooth){
				return position.x + positionModifier.x;
			} else{
				return position.x;
			}
		}
		
		override public function get y():Number{
			if(smooth){
				return position.y + positionModifier.y;
			} else{
				return position.y;
			}
		}
		
		override public function get z():Number{
			if(smooth){
				return position.z + positionModifier.z;
			} else{
				return position.z;
			}
		}
		
		override public function get dirty():Boolean{
			if (! animator) 
				return false;
			
			return animator.currentAnimation ? animator.currentAnimation.dirty : true;
		}
		
		override public function dispose():void{
			removeAllEffect();
			removeEventListener(EntityEvent.HIT, onHit);
			super.dispose();
		}
		
		public function talk(text:String, duration:int = 3000, parent:DisplayObjectContainer = null):void
		{
			if (isDead) return;
			if (_talk) {
				_talk.dispose();
			}
			if (! parent) {
				CONFIG::cpu {
					parent = _gs.clipForZOrder(ZOrder.ABOVE_OBJECT);
				}
			}
			_talk = new TalkPop(this, parent, text, duration);
		}
		
		public function emotion(text:String, duration:int = 3000, parent:DisplayObjectContainer = null):void {
			if (isDead) return;
			if (_emotion) {
				_emotion.dispose();
			}
			if (! parent) {
				CONFIG::cpu {
					parent = _gs.clipForZOrder(ZOrder.ABOVE_OBJECT);
				}
			}
			_emotion = new Emotion(this, parent, text, duration);
		}
		
		public function addPhantom():void {
			if(!_phantomFilter) {
				_phantomFilter = new PhantomFilter(this, _gs.clipForZOrder(ZOrder.BELOW_OBJECT));
			}
			_phantomFilter.visible = _isShowAvatar;
		}
		
		public function removePhantom():void {
			if(_phantomFilter) {
				_phantomFilter.remove();
				_phantomFilter = null;
			}
		}
		
		public function addPathEffect(effectID:int):void {
			if(!_pathFilter) {
				_pathFilter = new PathFilter(effectID, this, _gs);
			}
			_pathFilter.visible = _isShowAvatar;
		}
		
		public function removePathEffect():void {
			if(_pathFilter) {
				_pathFilter.remove();
				_pathFilter = null;
			}
		}
		
		public function get lightningEntity():LightningEntity
		{
			return _lightningEntity;
		}
		
		public function set lightningEntity(value:LightningEntity):void
		{
			_lightningEntity = value;
		}
		
		public function get isCasting():Boolean
		{
			return _isCasting;
		}
		
		public function get attackable():Boolean
		{
			return _attackable;
		}
		
		public function get isDead():Boolean
		{
			return _isDead;
		}
		
		public function get healthBar():HealthBar
		{
			return _healthBar;
		}
		
		public function set healthBar(value:HealthBar):void
		{
			_healthBar = value;
		}
		
		public function get attacking():Boolean
		{
			return _attacking;
		}
		
		public function get enemyTitle():EnemyTitle
		{
			return _enemyTitle;
		}
		
		public function set enemyTitle(value:EnemyTitle):void
		{
			_enemyTitle = value;
		}
		
		/**
		 * 幻影 
		 */
		public function get phantomFilter():PhantomFilter
		{
			return _phantomFilter;
		}
		
		/**
		 * 路径 
		 */
		public function get pathFilter():PathFilter
		{
			return _pathFilter;
		}

		public function get isShowAvatar():Boolean
		{
			return _isShowAvatar;
		}

		public function set isShowAvatar(value:Boolean):void
		{
			_isShowAvatar = value;
			
			_renderer.visible = _isShowAvatar;
			for(var effectId:String in _displayEffects){
				var entityEffect:EntityEffect = _displayEffects[effectId] as EntityEffect;
				if(entityEffect){
					entityEffect.visible = _isShowAvatar;
				}
			}
			
			if(_pathFilter) {
				_pathFilter.visible = _isShowAvatar;
			}
			if(_phantomFilter) {
				_phantomFilter.visible = _isShowAvatar;
			}
		}
		
		
	}
}