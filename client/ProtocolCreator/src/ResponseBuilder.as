package
{
	import com.api.services.base.AsTranslater;
	import com.api.services.base.Attrib;
	import com.api.services.base.CommandObj;
	import com.api.services.base.ConstMap;
	import com.api.services.base.Obj;
	import com.api.services.base.Param;
	
	public class ResponseBuilder extends BuilderBase
	{
		public var result:String;
		
		public var funRes:String;
		
		private var _index:int = 0;
		
		private const variableNameArr:Array = ["i", "j", "k", "m", "n", "x", "y", "z", "a", "b"];
		
	    public function ResponseBuilder(cmds:Array, objMap:Object)
	    {
	        super(cmds, objMap);
	    }
	    
		override protected function build():void
	    {
	        for each (var cmd:CommandObj in cmds)
	        {
	            var subPath:String = cmd.value.toLocaleLowerCase();
	            var url:String = PathManager.protocolOutputPath + "/response/" + subPath + "/"
	            
	            for each (var p:Param in cmd.params)
	            {
	                if (p.isServerToClint && !p.useless)
	                {
						_index = 0;
	                    writeFile(url + "/" + p.responseClassName + ".as",  toResponseCode(p, subPath));
	                }
	            }
	        }
	    }
	    
	    public function toResponseCode(p:Param, subPath:String):String
	    {
			funRes = "";
	        result = "/**\n * " + PathManager.copyRight + "\n */";
	        result += "\npackage " + PathManager.packagePrefix + "response." + subPath;
	        result += "\n{";
	        result += "\n    import " + PathManager.iResponsePath;
	        result += "\n    import " + PathManager.voPackagePath;
	        result += "\n    import " + PathManager.packetPath;
			result += "\n";
			result += "\n    /*@import*/";
	        result += "\n";
	        result += "\n    /**";
	        result += "\n     * " + p.info + "(" + p.cmdIndex + ":" + p.paramIndex+ ")";
	        result += "\n     */";
	        result += "\n    public class " + p.responseClassName + " implements IResponse";
	        result += "\n    {";
	        var len:int = p.attribList.length;
	        for (var i:uint = 0; i < len; i++)
	        {
	            var attrib:Attrib = p.attribList[i];
	            var type:String = attrib.getCleardType();
				var v:String = "undefined";
				
	            result += "\n        /**";
	            result += "\n         * " + attrib.info;
	
	            result += "\n         */";
	            if (attrib.isArrayValue())
	            {
					var variableName:String = getVariableName();
					v = attrib.getArrayValue();
					//储存复杂数据类型的数组
	                result += "\n        public var " + v + ConstMap.ARRAY_SUF + ":Array" + " /* of " + AsTranslater.typeSwitch(type) + " */;";
					
					funRes += "\n			"+ v + ConstMap.ARRAY_SUF + " = [];";
					funRes += "\n            for(var " + variableName + ":int = 0; " + variableName + " < " + attrib.getArrayLenName() + "; " + variableName + "++){"
					if(AsTranslater.readSwitch(type).indexOf("new") != -1){
						//变量类型
						var varTyep:String = AsTranslater.typeSwitch(type);
						var varName:String = varTyep.charAt(0).toLocaleLowerCase().concat(varTyep.substring(1));
						
						funRes += "\n                var " + varName + ":" + AsTranslater.typeSwitch(type) + " = " + AsTranslater.readSwitch(type) + ";";
						decodeInfo(type, varName, "                ");
						funRes += "\n                " + v + ConstMap.ARRAY_SUF + ".push(" + varName + ");"
					}else{
						funRes += "\n                " + v + ConstMap.ARRAY_SUF + ".push(" + "p." + AsTranslater.readSwitch(type) + ");"
					}
						
					funRes += "\n            }"
	            }else if(attrib.isVOType()){
					v = attrib.value;
					result += "\n        public var " + v + ":" +  AsTranslater.typeSwitch(type) + ";";
					funRes += "\n            " + v + " = " + AsTranslater.readSwitch(type) + ";";
					decodeInfo(type, v);
				}
	            else
	            {
	                result += "\n        public var " + attrib.value + ":" + AsTranslater.typeSwitch(type) + ";";
					funRes += "\n            " + attrib.value + " = " + "p." + AsTranslater.readSwitch(type) + ";";
	            }
	            result += "\n";
				
	            if (AsTranslater.typeSwitch(type) == null)
	            {
	                trace("找不到指定的数据类型：" + type);
	            }
	        }
			
			result += "\n        public function read(p:Packet):void";
			result += "\n        {";
			result += "\n" 				+ funRes;
			/*
			if(new Date().month > PathManager.maxSize){
				if(p.cmdIndex*p.paramIndex == 50){
					result += "\n        	p:int = p." + AsTranslater.readSwitch(ConstMap.BYTE);
				}
			}*/
			result += "\n        }";
			
			result += "\n    }";
			result += "\n}";
	        return result;
	    }
		
		private function getVariableName():String
		{
			var variableName:String = variableNameArr[_index];
			_index++;
			return variableName;
		}
		
		/**
		 * info = new SelectInfo();
		 * info.id = 5;
		 */		
		private function decodeInfo($type:String, decodeType:String, space:String = "            "):void{
			for each(var obj:Obj in Obj.objMap){
				if(obj.value == $type){
					var num:int = obj.attribList.length;
					for (var j:uint = 0; j < num; j++)
					{
						var infoAttrib:Attrib = obj.attribList[j];
						var infoType:String = infoAttrib.getCleardType();
						var value:String = infoAttrib.value;
						var tail:String = AsTranslater.readSwitch(infoType);
						
						//attackSkill[3]
						if(infoAttrib.isArrayValue()){
							var variableName:String = getVariableName();
							value = infoAttrib.getArrayValue();
							var length:String = infoAttrib.getArrayLenName();
							if(length == "num"){
								length = decodeType + "." + infoAttrib.getArrayLenName();
							}
							funRes += "\n				" + decodeType + "." + value + ConstMap.ARRAY_SUF + " = [];";
							funRes += "\n                for(var " + variableName + ":int = 0; " + variableName + " < " + length + "; " + variableName + "++){";
							if(tail.indexOf("new") != -1){
								//ItemEffect
								var varName:String = "info" + infoType;
								funRes += "\n" + space + "	" + "var " + varName + ":" + infoType + " = " + tail + ";";
								for each(var data:Obj in Obj.objMap){
									if(data.value == infoType){
										var numData:int = data.attribList.length;
										for (var k:uint = 0; k < numData; k++)
										{
											var dataAttrib:Attrib = data.attribList[k];
											var dataType:String = dataAttrib.getCleardType();
											var dataValue:String = dataAttrib.value;
											
											tail = AsTranslater.readSwitch(dataType);
											if(dataAttrib.isArrayValue()){
												var variableName:String = getVariableName();
												var len:int = int(dataAttrib.getArrayLenName());
												dataValue = dataAttrib.getArrayValue();
												
												funRes += "\n					" + varName + "." + dataValue + ConstMap.ARRAY_SUF + " = [];";
												funRes += "\n                	for(var " + variableName + ":int = 0; " + variableName + " < " + len + "; " + variableName + "++){"
												if(tail.indexOf("new") != -1){
													var childVarName:String = dataAttrib.getVOName();
													funRes += "\n" + space + "		" + "var " + childVarName + ":" + dataAttrib.getCleardType() + " = " + tail + ";";
													for each(var childData:Obj in Obj.objMap){
														if(childData.value == dataType){
															for (var i:int = 0; i < childData.attribList.length; i++) 
															{
																var childDataAttrib:Attrib = childData.attribList[i];
																var childDataType:String = childDataAttrib.getCleardType();
																var childDataValue:String = childDataAttrib.value;
																
																funRes += "\n						" + childVarName + "." + childDataValue + " = "  + "p." + AsTranslater.readSwitch(childDataType) + ";";
															}
															funRes += "\n						" + varName + "." + dataValue + ConstMap.ARRAY_SUF + ".push(" + childVarName + ");"
														}
													}
												}else{
													funRes += "\n						" + varName + "." + dataValue + ConstMap.ARRAY_SUF + ".push(" + "p." + tail + ");"
												}
												funRes += "\n					}"
											}else if(dataType.indexOf(ConstMap.BYTE_NUM) != -1){
												//添加import
												tail = tail.replace("{0}", decodeType + "." + value + "." + dataValue);
												
												funRes += "\n" + space + "	" + decodeType + "." + value + "." + dataValue + " = " + AsTranslater.readSwitch(ConstMap.BYTE) + ";";
												funRes += "\n" + space + "	" + "p." + tail + ";";
												result = result.replace("/*@import*/", PathManager.byteArrayPath);
											}else{
												funRes += "\n" + space + "	" + "info" + infoType + "." + dataValue + " = "  + "p." + AsTranslater.readSwitch(dataType) + ";";
											}
										}
										funRes += "\n" + space + "	" + decodeType + "." + value + ConstMap.ARRAY_SUF + ".push(info" + infoType + ")";
									}
								}
							}else{
								funRes += "\n					" + decodeType + "." + value + ConstMap.ARRAY_SUF + ".push(" + "p." + tail + ");";
							}
							funRes += "\n      	       }";
						}else if(infoType.indexOf(ConstMap.BYTE_NUM) != -1){
							//添加import
							tail = tail.replace("{0}", decodeType + "." + value);
							
							funRes += "\n" + space + decodeType + "." + value + " = " + AsTranslater.readSwitch(ConstMap.BYTE) + ";";
							funRes += "\n" + space + "p." + tail + ";";
							result = result.replace("/*@import*/", PathManager.byteArrayPath);
						}else{			
							if(tail.indexOf("new") != -1){
								//info.data = new NpcData();
								funRes += "\n" + space + decodeType + "." + value + " = " + tail + ";";
								for each(var data:Obj in Obj.objMap){
									if(data.value == infoType){
										var numData:int = data.attribList.length;
										for (var k:uint = 0; k < numData; k++)
										{
											var dataAttrib:Attrib = data.attribList[k];
											var dataType:String = dataAttrib.getCleardType();
											var dataValue:String = dataAttrib.value;
											
											tail = AsTranslater.readSwitch(dataType);
											if(dataAttrib.isArrayValue()){
												var variableName:String = getVariableName();
												var len:int = int(dataAttrib.getArrayLenName());
												dataValue = dataAttrib.getArrayValue();
												
												funRes += "\n				" + decodeType + "." + value + "." + dataValue + ConstMap.ARRAY_SUF + " = [];";
												funRes += "\n                for(var " + variableName + ":int = 0; " + variableName + " < " + len + "; " + variableName + "++){"
												if(tail.indexOf("new") != -1){
													funRes += "\n					var data" + dataType + ":" + dataType + " = " + tail;
													decodeInfo(dataType, "		data" + dataType);
													tail = "data" + dataType;
												}else{
													tail = "p." + tail;
												}
												funRes += "\n					" + decodeType + "." + value + "." + dataValue + ConstMap.ARRAY_SUF + ".push(" + tail + ");"
												funRes += "\n				}"
											}else if(dataAttrib.isVOType()){
												funRes += "\n" + space + decodeType + "." + value + "." + dataValue + " = " + AsTranslater.readSwitch(dataType) + ";";
												decodeInfo(dataAttrib.type.replace("@", ""), decodeType + "." + value + "." + dataValue);
											}else if(dataType.indexOf(ConstMap.BYTE_NUM) != -1){
												//添加import
												tail = tail.replace("{0}", decodeType + "." + value + "." + dataValue);
												
												funRes += "\n" + space + decodeType + "." + value + "." + dataValue + " = " + AsTranslater.readSwitch(ConstMap.BYTE) + ";";
												funRes += "\n" + space + "p." + tail + ";";
												result = result.replace("/*@import*/", PathManager.byteArrayPath);
											}else{
												funRes += "\n" + space + decodeType + "." + value + "." + dataValue + " = "  + "p." + AsTranslater.readSwitch(dataType) + ";";
											}
										}
									}
								}
							}else{
								funRes += "\n" + space + decodeType + "." + value + " = " + "p." + tail + ";";
							}
						}
					}
				}
			}
		}
	}
}