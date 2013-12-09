package
{
	import com.api.services.base.AsTranslater;
	import com.api.services.base.Attrib;
	import com.api.services.base.ConstMap;
	import com.api.services.base.Obj;
	
	public class ValueObjectBuilder extends BuilderBase
	{
	    public function ValueObjectBuilder(cmds:Array, objMap:Object)
	    {
	        super(cmds, objMap);
	    }
	
		override protected function build():void
	    {
	        var url:String = PathManager.protocolOutputPath + "/vo/";
	        for each (var obj:Obj in objMap)
	        {
	            writeFile(url + "/" + obj.value + ".as", toVOCode(obj));
	        }
	    }
	
	    public function toVOCode(obj:Obj):String
	    {
	        var result:String = "/**\n * " + PathManager.copyRight + "\n */";
	        result += "\npackage " + PathManager.packagePrefix + "vo";
	        result += "\n{";
	        result += "\n    /*@import*/";
	        result += "\n    /**";
	        result += "\n     * " + obj.info + "";
	        result += "\n     */";
	        result += "\n    public class " + obj.value;
	        result += "\n    {";
	        var len:int = obj.attribList.length;
	        for (var i:uint = 0; i < len; i++)
	        {
	            var attrib:Attrib = obj.attribList[i];
	            var type:String = attrib.getCleardType();
	            result += "\n        /**";
	            result += "\n         * " + attrib.info + "";
	            result += "\n         */";
	            if (attrib.isArrayValue())
	            {
	                result += "\n        public var " + attrib.getArrayParamName() + ":Array" + " /* of " + AsTranslater.typeSwitch(type) + " */;";
	            }
	            else
	            {
	                //判断是否为常量
	                if(attrib.consts)
	                {
	                    if(AsTranslater.typeSwitch(type) == "String")
	                    {
	                        result += "\n        public static const " + attrib.value + ":" + AsTranslater.typeSwitch(type) + " = \"" + attrib.consts + "\";";
	                    }
	                    else
	                    {
	                        result += "\n        public static const " + attrib.value + ":" + AsTranslater.typeSwitch(type) + " = " + attrib.consts + ";";
	                    }
	                }
	                else
	                {
	                    result += "\n        public var " + attrib.value + ":" + AsTranslater.typeSwitch(type) + ";";
	                }
					if(AsTranslater.typeSwitch(type) == "ByteArray"){
						result = result.replace("/*@import*/", "\n" + "    " + PathManager.byteArrayPath + "\n");
					}
	            }
	            result += "\n";
	
	            if (AsTranslater.typeSwitch(type) == null)
	            {
	                trace("找不到指定的数据类型：" + type);
	            }
	        }
	        result += "\n    }";
	        result += "\n}";
	
	        return result;
	    }
	}
}