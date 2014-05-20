package com.api.services.base
{
	public class Obj
	{
	    public static var objMap:Object = {};
		
		public static var tplMap:Object = {};
		
		public static var hashMap:Object = {};
	
		public var data:XML;
		
		public var value:String;
		
		public var info:String;
		
		public var attribList:Array = [];

		public function Obj(xml:XML)
	    {
	        this.data = xml;
	        this.value = xml.@value;
	        this.info = xml.@info;
	        buildAttribs();
	
			AsTranslater[value] = value;
	        objMap[value] = this;
	    }
	
	    private function buildAttribs():void
	    {
	        for each (var xml:XML in data.attrib)
	        {
	            var attrib:Attrib = new Attrib(xml);
	            attribList.push(attrib);
	        }
	    }
	}
}