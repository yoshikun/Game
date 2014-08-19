package com.yo.framework.utils
{
	import flash.utils.getTimer;

	public class AsyncTask
	{
		/**
		 * 任务ID 
		 */		
		public var id:String;
		/**
		 * 该任务限制时间 
		 */		
		public var limitTime:Number;
		/**
		 * 所有异步任务项 
		 */		
		public var items:Vector.<Object>;
		
		/**
		 * 优先级 
		 */		
		public var priority:int;
		
		public function AsyncTask()
		{
			items = new Vector.<Object>();
			priority = 10;
		}
		
		public function update():void {
			var startTime:int = getTimer();
			var e:Object;
			while (e = items.shift()) {
				e.f.apply(null, e.a);
				if(getTimer() - startTime >= limitTime){
					return;
				}
			}
		}
		
		public function add(f:Function, ...a):void
		{
			items.push({f:f, a:a});
		}
		
		public function finish():void {
			var e:Object;
			while (e = items.shift()) {
				e.f.apply(null, e.a);
			}
		}
	}
}