package com.yo.framework.core
{
	import flash.display.Stage;

	public class FP
	{
		public static var stage:Stage;
		
		public static var width:uint;
		
		public static var height:uint;
		
		/**
		 * 是否锁定帧频
		 */		
		public static var fixed:Boolean;
		
		/**
		 * 实际运行帧数
		 */
		public static var frameRate:Number;
		
		/**
		 * 初始化设置帧数
		 */
		public static var assignedFrameRate:Number;
		
		/**
		 * 在不固定帧数模式下，时间间隔
		 */
		public static var elapsed:Number;
		
		/**
		 * 在不固定帧频模式下，时间频率
		 */
		public static var rate:Number = 1;
		
		public function FP()
		{
		}
	}
}