package com.yo.framework.objects.animation
{
	import flash.display.MovieClip;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	
	public class AnimationInfo{
		/**
		 * 动画名 
		 */		
		public var name:String = "";
		
		/**
		 * 攻击点帧位置 
		 */		
		public var attack:int;
		
		/**
		 * 特效位置 
		 */		
		public var pos:String;
		
		/**
		 * 特效层级 
		 */		
		public var zindex:String;
		
		/**
		 * 特效中对本物体的影响 
		 */		
		public var filters:Array;
		
		/**
		 * 是否循环播放 
		 */		
		public var loop:Boolean = false;
		
		/**
		 * 延迟时间 
		 */		
		public var delay:Number;
		
		/**
		 * 总帧数 
		 */		 
		public var totalFrames:uint;
		
		/**
		 * 是否已加载完成 
		 */		
		public var loaded:Boolean = false;
		
		/**
		 * 帧信息 
		 */		
		public var frames:Vector.<AnimationFrameInfo>;
		
		public function AnimationInfo(){
			
		}
	}
}