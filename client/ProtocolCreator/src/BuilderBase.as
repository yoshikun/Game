package
{
	import com.api.services.base.Mustache;
	
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	public class BuilderBase
	{   
		protected var _mustache:Mustache;
		
		protected var cmds:Array;
		
	    protected var objMap:Object;
		
	    public function BuilderBase(cmds:Array, objMap:Object)
	    {
	        this.cmds = cmds;
	        this.objMap = objMap;
			
			build();
	    }
		
		protected function build():void{
			
		}
	    
	    protected function writeFile(path:String, value:String):void
	    {
	        var sfile:File = new File(path);
			if(sfile.exists && sfile.extension == "as" && !sfile.isHidden)
			{
				sfile.deleteFile();
			}
	        var sf:FileStream = new FileStream();
	        sf.open(sfile, FileMode.WRITE);
	        sf.writeUTFBytes(value);
	        sf.close();
	    }
	}
}