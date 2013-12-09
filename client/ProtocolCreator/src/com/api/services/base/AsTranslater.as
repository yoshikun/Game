package com.api.services.base
{
	public class AsTranslater extends Object
	{
		public static function typeSwitch(cType:String):String{
			if(cType.indexOf("byte") != -1){
				cType = ConstMap.BYTE;
			}
			if(cType.indexOf("char") != -1){
				cType = ConstMap.STRING;
			}
			switch(cType){
				case ConstMap.BYTE:
					return "ByteArray";
				case ConstMap.STRING:
					return "String";
				case ConstMap.UINT8_T:
				case ConstMap.UINT16_T:
				case ConstMap.UINT32_T:
					return "uint";
				case ConstMap.INT8_T:
				case ConstMap.INT16_T:
				case ConstMap.INT32_T:
					return "int"
				case ConstMap.FLOAT:
					return "Number";
				default :
					return cType;
			}
		}
		
		public static function readSwitch(cType:String):String{
			var str:String = "";
			if(cType.indexOf("byte[") != -1){
				str = cType.split("byte")[1] as String;//[2]
				str = str.split("[")[1] as String;
				str = str.split("]")[0] as String;
				cType = ConstMap.BYTE_NUM;
			}
			if(cType.indexOf("char") != -1){
				if(cType.indexOf("num") != -1){
					//char[num]
					cType = ConstMap.UTF;
				}else{
					//char[32]
					str = getArrayLenName(cType);
					cType = ConstMap.STRING;
				}
			}
			switch(cType){
				case ConstMap.BYTE:
					return "new ByteArray()";
				case ConstMap.BYTE_NUM:
					return "readBytes({0}, p.position, " + str + ")";
				case ConstMap.STRING: 
					return "readMultiByte(" + str + "," + " \"utf-8\")";
				case ConstMap.UTF:
					return "readUTF()";
				case ConstMap.UINT8_T: 
					return "readUnsignedByte()";
				case ConstMap.UINT16_T: 
					return "readUnsignedShort()";
				case ConstMap.UINT32_T: 
					return "readUnsignedInt()";
				case ConstMap.FLOAT:
					return "readFloat()";
				case ConstMap.INT8_T: 
					return "readByte()";
				case ConstMap.INT16_T: 
					return "readShort()";
				case ConstMap.INT32_T: 
					return "readInt()";
				default :
					return "new " + cType + "()";
			}
		}
		
		public static function writeSwitch(cType:String):String{
			var len:int = 0;
			if(cType.indexOf("char") != -1){
				if(cType.indexOf("num") != -1){
					//char[num]
					cType = ConstMap.UTF;
				}else{
					//char[32]
					len = cType.split("char[")[1].toString().split("]")[0];
					cType = ConstMap.STRING;
				}
			}
			switch(cType){
				case ConstMap.BYTE:
					return "";
				case ConstMap.BYTE_NUM:
					return "";
				case ConstMap.STRING: 
					return "writeMultiBytes(" + "{0}" + "," + " " + len + ")";
				case ConstMap.UTF:
					return "writeUTF({0})";
				case ConstMap.UINT8_T: 
					return "writeByte(" + "{0}" + ")";
				case ConstMap.UINT16_T: 
					return "writeShort(" + "{0}" + ")";
				case ConstMap.UINT32_T: 
					return "writeUnsignedInt(" + "{0}" + ")";
				case ConstMap.FLOAT:
					return "writeFloat({0})";
				default :
					return "";
			}
		}
		
		public static function getArrayLenName(value:String):String
		{
			return value.slice(value.indexOf("[") + 1, value.indexOf("]"));
		}
	}
}