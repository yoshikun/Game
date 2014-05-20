package com.api.services.base
{
	public dynamic class Param
	{
		private var _xml:XML;
		private var _responseClassName:String;
		private var _requestClassName:String;
		
		public var cmdIndex:int;
		public var paramIndex:int;
		
		public var subPath:String;
		
		public var value:String;
		public var info:String;
		public var path:String;
		public var url:String;
		
		/**
		 * 该协议是否无用
		 */    
		public var useless:Boolean = false;
		
		public var attribList:Array = [];
		
		public var isServerToClint:Boolean;
		
	    public function Param(xml:XML, cmdIndex:int, paramIndex:int, subPath:String)
	    {
			_xml = xml;
	        this.cmdIndex = cmdIndex;
	        this.paramIndex = paramIndex;
			this.subPath = subPath;
	
	        this.value = xml.@value;
	        this.path = xml.@path;
	        this.info = xml.@info;
	        this.useless = (xml.@useless == "true");
	
	        this.isServerToClint = (path == "S > C");
	
	        buildAttribs();
			initName();
	    }
		
		private function initName():void
		{
			_responseClassName = getSendFunName();
			_responseClassName = _responseClassName.substr(0, 1).toLocaleUpperCase() + _responseClassName.substr(1);
			_responseClassName += ConstMap.RESPONSE_CLASS_SUF;
			
			_requestClassName = getSendFunName();
			_requestClassName = _requestClassName.substr(0, 1).toLocaleUpperCase() + _requestClassName.substr(1);
			_requestClassName += ConstMap.REQUEST_CLASS_SUF;
		}
		
	    private function buildAttribs():void
	    {
	        for each (var xml:XML in _xml.attrib)
	        {
	            var attrib:Attrib = new Attrib(xml);
	            attribList.push(attrib);
	        }
	    }
	    
	    public function getSendFunName():String
	    {
	        var result:String = value;
	        result = result.toLocaleLowerCase();
	        var arr:Array = result.split("_");
	        result = "";
	        for (var i:uint = 0; i < arr.length; i++)
	        {
	            var t:String = arr[i];
	            if (i > 0)
	            {
	                t = t.substr(0, 1).toLocaleUpperCase() + t.substr(1);
	            }
	            result += t;
	        }
	        return result;
	    }

		public function get xml():XML
		{
			return _xml;
		}

		public function set requestClassName(value:String):void
		{
			_requestClassName = value;
		}

		public function set responseClassName(value:String):void
		{
			_responseClassName = value;
		}
	
		public function get responseClassName():String
		{
			return _responseClassName;
		}
		
		public function get requestClassName():String
		{
			return _requestClassName;
		}
	
	}
}