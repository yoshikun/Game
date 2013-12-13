package com.yo.core
{
	import com.adobe.utils.DateUtil;
	import com.yo.manager.ProfilerManager;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.ContextMenuEvent;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;
	import flash.net.LocalConnection;
	import flash.system.System;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	import flash.utils.Timer;
	import flash.utils.getTimer;
	
	import org.aswing.KeyboardManager;
	
//	[SWF(width="1000", height="600", frameRate="60", backgroundColor="#0")]
	public class Game extends Sprite
	{
		protected var _contextMenu:ContextMenu;
		
		/**
		 * 右键菜单 
		 */		
		protected var _captionArr:Array = ["概览", "全屏", "清理"];
		
		/**
		 * 暂停更新和渲染update/render
		 */
		protected var _paused:Boolean = false;
		
		/**
		 * 最大跳帧数
		 */
		protected var _maxFrameSkip:uint = 5;
		
		/**
		 * 固定帧频下两帧之间的间隔时间
		 */
		protected var _tickRate:uint = 4;
		
		protected var _rate:Number;
		
		protected var _delta:Number = 0;
		
		protected var _prev:Number;
		
		protected var _last:uint;
		
		protected var _timer:Timer;
		
		protected var _skip:Number;
		
		protected var _frameLast:uint = 0;
		
		protected var _frameListSum:uint = 0;
		
		protected var _frameList:Vector.<uint> = new Vector.<uint>;
		
		public function Game()
		{
			if(stage){
				init();
			}else{
				this.addEventListener(Event.ADDED_TO_STAGE, __addedToStage);
			}
		}
		
		protected function __addedToStage(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, __addedToStage);
			init();
		}		
		
		protected function init():void {
			initModel();
			initManager();
			initEvent();
			initContextMenu();
			initView();
		}
		
		protected function initView():void
		{
			
		}
		
		/**
		 * 初始化数据
		 */		
		protected function initModel():void
		{
			FP.assignedFrameRate = 30;
			FP.stage = stage;
			
			stage.frameRate = FP.assignedFrameRate;
			stage.align = StageAlign.TOP_LEFT;
			stage.quality = StageQuality.HIGH;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.displayState = StageDisplayState.NORMAL;
			
			_rate = 1000 / FP.assignedFrameRate;
			if(!FP.fixed){
				_skip = _rate * _maxFrameSkip;
				_last = _prev = getTimer();
				_timer = new Timer(_tickRate);
				_timer.addEventListener(TimerEvent.TIMER, __timer);
				_timer.start();
			}else{
				_last = getTimer();
				addEventListener(Event.ENTER_FRAME, __enterFrame);
			}
		}
		
		protected function initEvent():void
		{
			this.addEventListener(Event.ENTER_FRAME, __enterFrame);
		}
		
		protected function initManager():void
		{
			//状态监视
			ProfilerManager.instance.init(stage);
			ProfilerManager.instance.start();
//			ProfilerManager.instance.toggleDisplay();
			//键盘管理
			KeyboardManager.getInstance().init(stage);
		}
		
		/**
		 * 初始化右键菜单
		 */		
		protected function initContextMenu():void
		{
			var date:Date = getCompilationDate();
			var compileTime:String = DateUtil.getChinaDate(date) + date.hours + "时" + date.minutes + "分" + date.seconds + "秒"
			_captionArr.push("编译 " + compileTime);
			
			_contextMenu = new ContextMenu();
			_contextMenu.hideBuiltInItems();
			_contextMenu.customItems = [];
			
			var len:int = _captionArr.length;
			for(var i:int = 0; i < len; i++) 
			{
				var item:ContextMenuItem = new ContextMenuItem(_captionArr[i], true);
				item.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, __menuItemSelect);
				_contextMenu.customItems.push(item);
			}
			
			this.contextMenu = _contextMenu;
		}		
		
		/**
		 * 选择菜单选项
		 */		
		protected function __menuItemSelect(e:ContextMenuEvent):void{
			var item:ContextMenuItem = e.currentTarget as ContextMenuItem;
			switch(item.caption)
			{
				case _captionArr[0]:
					toggleProfilerDisplay();
					break;
				case _captionArr[1]:
					toggleFullScreen();
					break;
				case _captionArr[2]:
					clearMenory();
					break;
				default:
					break;
			}
		}
		
		/**
		 * 编译时间
		 */		
		protected function getCompilationDate():Date {
			var swf:ByteArray = stage.loaderInfo.bytes;
			if (!swf){
				return new Date();
			}
			swf.endian = Endian.LITTLE_ENDIAN;
			
			// Signature + Version + FileLength + FrameSize + FrameRate + FrameCount
			swf.position = 3 + 1 + 4 + (Math.ceil(((swf[8] >> 3) * 4 - 3) / 8) + 1) + 2 + 2;
			while (swf.position != swf.length) {
				var tagHeader:uint = swf.readUnsignedShort();
				
				if (tagHeader >> 6 == 41) {
					// ProductID + Edition + MajorVersion + MinorVersion + BuildLow + BuildHigg
					swf.position += 4 + 4 + 1 + 1 + 4 + 4;
					var milli:Number = swf.readUnsignedInt();
					var date:Date = new Date();
					date.setTime(milli + swf.readUnsignedInt() * 4294967296);
					return date;
				} else {
					swf.position += (tagHeader & 63) != 63 ? (tagHeader & 63) : swf.readUnsignedInt() + 4;
				}
			}
			return new Date();
		}
		
		protected function toggleProfilerDisplay():void
		{
			ProfilerManager.instance.toggleDisplay();
		}
		
		protected function toggleFullScreen():void {
			if(stage.displayState == StageDisplayState.FULL_SCREEN) {
				exitFullScreen();
			}else{
				goScaledFullScreen();
			}
		}
		
		protected function goScaledFullScreen():void
		{
			var rect:Rectangle = new flash.geom.Rectangle(0, 0, stage.stageWidth, stage.stageHeight);
			stage.fullScreenSourceRect = rect;
//			stage.displayState = StageDisplayState.FULL_SCREEN;
			stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
		}
		
		/**
		 * 内存清理
		 */
		public static function clearMenory():void
		{
			try{
				new LocalConnection().connect("foo");
				new LocalConnection().connect("foo");
			}catch(error : Error){
			
			}
			System.gc();
		}
		
		/**
		 * 退出全屏
		 */		
		protected function exitFullScreen():void
		{
			stage.displayState = StageDisplayState.NORMAL;
		}
		
		protected function __enterFrame(event:Event):void
		{
			//计算帧时间间隔
			var time:uint = getTimer();
			var elapsed:Number = (time - _last) / 1000;
			_last = time;
			
			//每帧最大使用时间
			var maxElapsed:Number = FP.assignedFrameRate / 1000;
			if(elapsed > maxElapsed){
				elapsed = maxElapsed;
			}
			elapsed *= FP.rate;
			FP.elapsed = elapsed;
			
			if(!_paused){
				update();
			}
		}
		
		protected function __timer(event:TimerEvent):void
		{
			var time:uint = getTimer();
			_delta += (time - _last);
			_last = time;
			
			if(_delta < _rate){
				return;
			}

			if(_delta > _skip){
				_delta = _skip;
			}
			
			while(_delta > _rate)
			{
				_delta -= _rate;
				FP.elapsed =(time - _prev) / 1000;
				var maxElapsed:Number = FP.assignedFrameRate / 1000;
				if(FP.elapsed > maxElapsed){
					FP.elapsed = maxElapsed;
				}
				FP.elapsed *= FP.rate;
				_prev = time;
				
				if(!_paused){
					update();
				}
			}
		}
		
		protected function update():void
		{

		}
	}
}