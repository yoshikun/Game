package core
{
	public class AsyncPool
	{
		private var _tasks:Vector.<AsyncTask>;
		
		public static var instance:AsyncPool = new AsyncPool();
		
		public function AsyncPool()
		{
			_tasks = new Vector.<AsyncTask>();
		}
		
		public function getAsyncTask(id:int):AsyncTask{
			var task:AsyncTask;
			for each(task in _tasks){
				if (task.id === id) {
					return task;
				}
			}
			
			task = new AsyncTask();
			task.id = id;
			_tasks.push(task);
			_tasks.sort(soryByPriority);
			
			return task;
		}
		
		private function soryByPriority(a:AsyncTask, b:AsyncTask):int{
			return a.priority - b.priority;
		}
		
		public function clear(id:int):void{
			for(var key:String in _tasks){
				var t:AsyncTask = _tasks[key];
				if(t.id === id){
					_tasks.splice(Number(key), 1);
					return;
				}
			}
		}
		
		public function update():void{
			for each(var t:AsyncTask in _tasks){
				t.update();
			}
		}
		
		public function finish():void{
			for each(var t:AsyncTask in _tasks){
				t.finish();
			}
		}
	}
}