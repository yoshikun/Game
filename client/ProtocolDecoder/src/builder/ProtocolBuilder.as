package builder
{
	import com.api.services.base.CommandObj;
	import com.api.services.base.ConstMap;
	import com.api.services.base.Mustache;
	import com.api.services.base.Obj;
	import com.api.services.base.Param;
	import com.api.services.base.XMLSerialize;
	
	import core.BuilderBase;
	import core.PathManager;
	
	import flash.utils.Dictionary;

	public class ProtocolBuilder extends BuilderBase
	{
		private var _dataArr:Array;
		private var _paramsDic:Dictionary;
		
		public function ProtocolBuilder(cmds:Array, objMap:Object)
		{
			super(cmds, objMap);
		}
		
		override public function build():void{
			_mustache = new Mustache();
			_dataArr = [];
			_paramsDic = new Dictionary();
			
			for each(var cmd:CommandObj in _cmds){
				var len:int = cmd.params.length;
				for (var i:int = 0; i < len; i++){
					var param:Param = cmd.params[i];
					_paramsDic[param.isServerToClint ? param.responseClassName : param.requestClassName] = param;
				}
			}
			
			var url:String = PathManager.appPath + PathManager.protocolOutputPath;
			for each (var cmd:CommandObj in _cmds)
			{
				for each (var p:Param in cmd.params)
				{
					if (p.isServerToClint && !p.useless)
					{
						var motoName:String = p.requestClassName.replace(ConstMap.RESPONSE_CLASS_SUF, ConstMap.REQUEST_CLASS_SUF);
						if(!_paramsDic[motoName]){
							p.requestClassName = "";
						}
						var o:Object = {};
						XMLSerialize.decodeToObject(p, o);
						_dataArr.push(o);
					}
				}
			}
			Obj.hashMap = {data:_dataArr};
			
			writeFile(url + "/Protocol.as",  toCode());
		}
		
		private function toCode():String{
			return _mustache.to_html(Obj.tplMap["Protocol.tpl"], Obj.hashMap);
		}
	}
}