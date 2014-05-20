package core
{
	import com.api.services.base.Mustache;
	
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	public class BuilderBase
	{   
		protected var _mustache:Mustache;
		
		protected var _cmds:Array;
		
	    protected var _objMap:Object;
		
	    public function BuilderBase(cmds:Array, objMap:Object)
	    {
	        _cmds = cmds;
	        _objMap = objMap;
	    }
		
		public function build():void{
			
		}
	    
	    protected function writeFile(path:String, value:String):void
	    {
			AsyncPool.instance.getAsyncTask(TaskEnum.BUILD).add(function():void{
				var file:File = new File(path);
				if(file.exists && file.extension == "as" && !file.isHidden)
				{
					file.deleteFile();
				}
				var sf:FileStream = new FileStream();
				sf.open(file, FileMode.WRITE);
				sf.writeUTFBytes(value);
				sf.close();
				
				GlobalEventDispatcher.dispatchEvent(GlobalEvent.BUILD_COMPLETE, file.name + "创建完成");
			});
	    }
	}
}