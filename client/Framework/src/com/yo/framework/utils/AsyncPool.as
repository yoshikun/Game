package com.yo.framework.utils
{
	import com.yo.framework.logger.Log;

	/**
	 * 异步任务池 
	 */	
	public class AsyncPool
	{
		private var _tasks:Vector.<AsyncTask>;
		private var _log:Log;
		public static var instance:AsyncPool = new AsyncPool();
		
		public function AsyncPool()
		{
			_tasks = new Vector.<AsyncTask>();
			_log = Log.getLog(this); 
		}
		
		public function create(id:String, limitTime:Number, priority:int = 10):AsyncTask {
			var t:AsyncTask;
			for each (t in _tasks) {
				if (t.id === id) {
					_log.warn("异步任务重复:", id);
					return t;
				}
			}
			t = new AsyncTask();
			t.id = id;
			t.limitTime = limitTime;
			t.priority = priority;
			_tasks.push(t);
			_tasks.sort(soryByPriority);
			return t;
		}
		
		private function soryByPriority(a:AsyncTask, b:AsyncTask):int
		{
			return a.priority - b.priority;
		}
		
		public function clear(id:String):void {
			for (var key:String in _tasks) {
				var t:AsyncTask = _tasks[key];
				if (t.id === id) {
					_tasks.splice(Number(key), 1);
					return;
				}
			}
			_log.warn("异步任务不存在");
		}
		
		public function update():void {
			for each (var t:AsyncTask in _tasks) {
				t.update();
			}
		}
		
		public function finish():void {
			for each (var t:AsyncTask in _tasks) {
				t.finish();
			}
		}
	}
}