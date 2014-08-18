package com.yo.game.data.cache.decoder
{
	import com.adobe.utils.DateUtil;
	
	import flash.utils.Dictionary;
	import flash.utils.describeType;
	import flash.xml.XMLDocument;
	import flash.xml.XMLNode;
	import flash.xml.XMLNodeType;
	
	public class XMLSerialize {
		
		/**
		 * 把obj对象解析为节点型的xml,并且保留数据,和describeType是不一样滴
		 */
		public static function encode(nodename:String,obj:Object):XML
		{
			var translater:XMLTranslater = new XMLTranslater();
			return translater.writeXmlNode(nodename, obj);
		}
		
		public static function decodeAttribute(x:XML):Object{
			var translater:XMLTranslater = new XMLTranslater();
			translater.readXmlAttribute(x);
			return translater.items;
		}
		
		/**
		 * 把简单节点型xml解析为Object对象
		 */
		public static function decode(x:XML):Object
		{
			var translater:XMLTranslater = new XMLTranslater();
			translater.readXmlNode(x);
			return translater.items;
		}
		
		/**
		 * 把xml节点解析为classDef类对象
		 */
		public static function decodeType(x:XML, classDef:Class, classInfo:XML = null):*
		{
			var translater:XMLTranslater = new XMLTranslater();
			translater.readXmlNode(x);
			
			var result:Object = new classDef();
			var xml:XML = classInfo == null ? describeType(result) : classInfo;
			copyProperty(translater,result,xml);
			return result;
		}
		
		/**
		 * 把xml中的数据放入value对象对应的属性中
		 */		
		public static function decodeObject(x:XML, result:*, classInfo:XML = null):*
		{
			var translater:XMLTranslater = new XMLTranslater();
			translater.readXmlNode(x);
			if(!classInfo){
				classInfo = describeType(result);
			}
			copyProperty(translater, result, classInfo);
			return translater;
		}
		
		/**
		 * 把source类的所有属性值放到result类中
		 * 	result包含source里面的所有属性
		 */		
		public static function copyToOther(source:*, result:*, classInfo:XML = null):*{
			if(source.hasOwnProperty("copyTo")){
				if(source["copyTo"] is Function){
					source["copyTo"](result);
					return result;
				}
			}
			var xml:XML = describeType(source);
			var className:String = xml.localName();
			if(!classInfo){
				classInfo = describeType(source);
			}
			var sourceXml:XML = XMLSerialize.encode(className, source);
			decodeObject(sourceXml, result, classInfo);
			return result;
		}

		/**
		 * 把translater中的数据,拷贝到result中的classInfo包含的属性中
		 */		
		private static function copyProperty(translater:XMLTranslater, result:Object, classInfo:XML):void
		{
			for each (var v:XML in classInfo..*.( name() == "variable" || name() == "accessor" )) 
			{
				//判断在resurlt中是否存在classInfo里面有的属性
				var propertyName:String = v.@name;
				if(!result.hasOwnProperty(propertyName)){
					continue;
				}
				var t:String = v.@type;
				switch(t)
				{
					case "Boolean":
						result[propertyName] = translater.getBoolean(propertyName);
						break;
					case "int":
						result[propertyName] = translater.getInt(propertyName);
						break;
					case "Number":
						result[propertyName] = translater.getNumber(propertyName);
						break;
					case "uint":
						result[propertyName] = translater.getUint(propertyName);
						break;
					case "String":
						result[propertyName] = translater.getString(propertyName);
						break;
					case "Date":
						result[propertyName] = DateUtil.getDateByStr(translater.getString(propertyName));
						break;
				}
			}
		}
		
		/**
		 * 把有复杂结构的xml解析为树型object
		 */
		public static function decodeComplexXml(xml:XML):Object{
			return decodeXml(new XMLDocument(xml))[xml.localName()];
		}
		
		private static function decodeXml(dataNode:XMLNode):Object
		{
			var result:Object;
			var isSimpleType:Boolean = false;
			
			if (dataNode == null)
				return null;
			
			// Cycle through the subnodes
			var children:Array = dataNode.childNodes;
			if (children.length == 1 && children[0].nodeType == XMLNodeType.TEXT_NODE)
			{
				// If exactly one text node subtype, we must want a simple
				// value.
				isSimpleType = true;
				result = simpleType(children[0].nodeValue);
			}
			else if (children.length > 0)
			{
				result = {};
				
				for (var i:uint = 0; i < children.length; i++)
				{
					var partNode:XMLNode = children[i];
					
					// skip text nodes, which are part of mixed content
					if (partNode.nodeType != XMLNodeType.ELEMENT_NODE)
					{
						continue;
					}
					
					var partName:String = getLocalName(partNode);
					var partObj:Object = decodeXml(partNode);
					
					// Enable processing multiple copies of the same element (sequences)
					var existing:Object = result[partName];
					if (existing != null)
					{
						if (existing is Array)
						{
							existing.push(partObj);
						}
						else
						{
							existing = [existing];
							existing.push(partObj);
							
							result[partName] = existing;
						}
					}
					else
					{
						result[partName] = partObj;
					}
				}
			}
			
			// Cycle through the attributes
			var attributes:Object = dataNode.attributes;
			for (var attribute:String in attributes)
			{
				if (attribute == "xmlns" || attribute.indexOf("xmlns:") != -1)
					continue;
				
				// result can be null if it contains no children.
				if (result == null)
				{
					result = {};
				}
				
				
				result[attribute] = simpleType(attributes[attribute]);
			}
			
			return result;
		}
		
		private static function simpleType(val:Object):Object
		{
			var result:Object = val;
			
			if (val != null)
			{
				//return the value as a string, a boolean or a number.
				//numbers that start with 0 are left as strings
				//bForceObject removed since we'll take care of converting to a String or Number object later
				if (val is String && String(val) == "")
				{
					result = val.toString();    
				}
				else if (isNaN(Number(val)) || (val.charAt(0) == '0') || ((val.charAt(0) == '-') && (val.charAt(1) == '0')) || val.charAt(val.length -1) == 'E')
				{
					var valStr:String = val.toString();
					
					//Bug 101205: Also check for boolean
					var valStrLC:String = valStr.toLowerCase();
					if (valStrLC == "true")
						result = true;
					else if (valStrLC == "false")
						result = false;
					else
						result = valStr;
				}
				else
				{
					result = Number(val);
				}
			}
			
			return result;
		}
		
		/**
		 * Returns the local name of an XMLNode.
		 */
		private static function getLocalName(xmlNode:XMLNode):String
		{
			var name:String = xmlNode.nodeName;
			var myPrefixIndex:int = name.indexOf(":");
			if (myPrefixIndex != -1)
			{
				name = name.substring(myPrefixIndex+1);
			}
			return name;
		}
	}
}
