package com.api.services.base
{
	import flash.utils.describeType;
	
	public class XMLSerialize {
		
		/**
		 * 把obj对象serialize为名为nodename的XML节点
		 * @return <{nodename} {property}="{value}" ..... />
		 */
		public static function encode(nodename:String,obj:Object):XML
		{
			var translater:XMLTranslater = new XMLTranslater();
			return translater.writeXmlNode(nodename, obj);
		}
		
		/**
		 * 把XML节点deserialize为Object对象
		 */
		public static function decode(x:XML):Object
		{
			var translater:XMLTranslater = new XMLTranslater();
			translater.readXmlNode(x);
			return translater.items;
		}
		/**
		 * 把XML节点deserialize为type对象
		 */
		public static function decodeType(x:XML,type:Class,classInfo:XML = null):*
		{
			var translater:XMLTranslater = new XMLTranslater();
			translater.readXmlNode(x);
			
			var result:Object = new type();
			var ci:XML = classInfo == null ? describeType(result) : classInfo;
			copyProperty(translater,result,ci);
			return result;
		}
		
		public static function decodeObject(x:XML, value:*):*
		{
			var translater:XMLTranslater = new XMLTranslater();
			translater.readXmlNode(x);
			copyProperty(translater, value, describeType(value));
			return value;
		}
		
		public static function copyProperty(translater:XMLTranslater, result:Object, classInfo:XML):void
		{
			for each ( var v:XML in classInfo..*.( name() == "variable" || name() == "accessor" ) ) 
			{
				var t:String = v.@type;
				switch(t)
				{
					case "Boolean":
						result[v.@name] = translater.getBoolean(v.@name);
						break;
					case "int":
						result[v.@name] = translater.getInt(v.@name);
						break;
					case "Number":
						result[v.@name] = translater.getNumber(v.@name);
						break;
					case "uint":
						result[v.@name] = translater.getUint(v.@name);
						break;
					case "String":
						result[v.@name] = translater.getString(v.@name);
						break;
					case "Date":
//						result[v.@name] = DateUtil.getDateByStr(translater.getString(v.@name));
						break;
				}
			}
		}
		
		public static function decodeToObject(source:*, result:Object):Object{
			var x:XML = XMLSerialize.encode("info", source);
			var translater:XMLTranslater = new XMLTranslater();
			translater.readXmlNode(x);
			copyProperty(translater, result, describeType(source));
			return result;
		}
	}
}
