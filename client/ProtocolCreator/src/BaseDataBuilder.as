package
{
	import com.api.services.base.Mustache;
	import com.api.services.base.Obj;
	import com.api.services.base.XMLSerialize;

	public class BaseDataBuilder extends BuilderBase
	{
		private var _dataArr:Array;
		
		private var _callBack:Function;
		
		public function BaseDataBuilder(cmds:Array, objMap:Object, baseDataArr:Array, callBack:Function)
		{
			_dataArr = baseDataArr;
			_callBack = callBack;
			super(cmds, objMap);
		}
		
		override protected function build():void{
			_mustache = new Mustache();
			var forMustacheData:Array = [];
			
			var url:String = PathManager.dataXmlOutputPath;
			for each (var obj:Object in _dataArr)
			{
				writeFile(url + "/" + obj["className"] + ".as",  toCode(obj));
				_callBack(obj["className"] + ".as" + "创建完成");
			}
		}
		
		private function toCode(obj:Object):String{
			return _mustache.to_html(Obj.tplMap["BaseData.tpl"], obj);
		}
	}
}