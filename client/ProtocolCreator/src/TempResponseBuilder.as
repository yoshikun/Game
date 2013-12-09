package
{
	import com.api.services.base.AsTranslater;
	import com.api.services.base.Attrib;
	import com.api.services.base.CommandObj;
	import com.api.services.base.ConstMap;
	import com.api.services.base.Mustache;
	import com.api.services.base.Obj;
	import com.api.services.base.Param;
	import com.api.services.base.XMLSerialize;
	
	import flash.utils.describeType;
	
	public class TempResponseBuilder extends BuilderBase
	{
		public var result:String;
		
		public var funRes:String;
		
		public var includeRes:String;
		
		public function TempResponseBuilder(cmds:Array, objMap:Object)
		{
			super(cmds, objMap);
		}
		
		override protected function build():void
		{
			_mustache = new Mustache();
			
			for each (var cmd:CommandObj in cmds)
			{
				var subPath:String = cmd.value.toLocaleLowerCase();
				var url:String = PathManager.protocolOutputPath + "/response/" + subPath + "/"
				
				for each (var p:Param in cmd.params)
				{
					if (p.isServerToClint && !p.useless)
					{
						p.url = PathManager.packagePrefix + "response." + subPath;
						
						writeFile(url + "/" + p.responseClassName + ".php",  toResponseCode(p));
					}
				}
			}
		}
		
		public function toResponseCode(p:Param):String
		{
			var o:Object = toObject(p);
			return _mustache.to_html(Obj.tplMap["Response.tpl"], o);
		}
		
		/**
		 * 将传入数据转换为Object类型,因为测试其他类型Mustache不支持
		 * 2013.10.30
		 */		
		private function toObject(p:Param):Object
		{
			var o:Object = {};
			XMLSerialize.decodeToObject(p, o);
			
			var attribList:Array = decodeAttribList(p.attribList);
			
			o["attribList"] = attribList;
			return o;
		}
		
		/**
		 * 解析attribList中的对象
		 */		
		private function decodeAttribList(source:Array):Array
		{
			var attribList:Array = [];
			var len:int = source.length;
			for (var i:int = 0; i < len; i++) 
			{
				var attrib:Attrib = source[i];
				var attribObj:Object = decodeAttrib(attrib, i);
				
				attribList.push(attribObj);
			}
			return attribList;
		}
		
		/**
		 * 解析attrib对象
		 */		
		private function decodeAttrib(attrib:Attrib, attribIndex:int):Object
		{
			var attribObj:Object = {};
			XMLSerialize.decodeToObject(attrib, attribObj);
			
			//类型转换
			attribObj.type = attrib.getCleardType();
			attribObj.type = AsTranslater.typeSwitch(attribObj.type);
			
			//数组名转换
			attribObj.isArrayValue = false;
			if(attrib.isArrayValue()){
				attribObj.value = attrib.getArrayValue() + ConstMap.ARRAY_SUF;
				attribObj.isArrayValue = true;
				//for循环中i的名字
				attribObj.indexName = ConstMap.VARIABLE_NAME_LIST[attribIndex];
				//for循环中len的名字
				attribObj.lenName = attrib.getArrayLenName();
				
				saveAttribList(attribObj, attribObj.type);
			}else if(attrib.isVOType()){
				attribObj.isVOType = attrib.isVOType();
				
//				saveAttribList(attribObj, attribObj.type);
			}else{
				attribObj.isSimple = true;
				attribObj.readType = AsTranslater.readSwitch(attrib.type);
			}
			return attribObj;
		}
		
		private function saveAttribList(attribObj:Object, attribType:String):void
		{
			var obj:Obj = Obj.objMap[attribType];
			if(obj){
				attribObj[attribType] = obj.attribList;
			}
		}
	}
}