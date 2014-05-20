package builder
{
	import com.api.services.base.Mustache;
	import com.api.services.base.Obj;
	import com.api.services.base.XMLSerialize;
	
	import core.BuilderBase;
	import core.PathManager;

	public class BaseDataBuilder extends BuilderBase
	{
		private var _dataArr:Array;
		
		public function BaseDataBuilder(cmds:Array, objMap:Object, baseDataArr:Array)
		{
			_dataArr = baseDataArr;
			super(cmds, objMap);
		}
		
		override public function build():void{
			_mustache = new Mustache();
			var forMustacheData:Array = [];
			
			var url:String = PathManager.appPath + PathManager.dataXmlOutputPath;
			for each (var obj:Object in _dataArr)
			{
				writeFile(url + "/" + obj["className"] + ".as",  toCode(obj));
			}
		}
		
		private function toCode(obj:Object):String{
			return _mustache.to_html(Obj.tplMap["BaseData.tpl"], obj);
		}
	}
}