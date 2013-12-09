package com.api.services.base
{

	public class CommandObj
	{
		private var data:XML;
		public var value:String;
		public var cmdIndex:int;
		
		public var params:Array = [];
		
	    public function CommandObj(xml:XML, cmdIndex:int)
	    {
	        this.data = xml;
	        this.cmdIndex = cmdIndex;
	        this.value = xml.@value;
	
	        parseParam();
	    }
	
	    private function parseParam():void
	    {
	        var index:int = 1;
	        for each (var xml:XML in data.param)
	        {
	            var param:Param = new Param(xml, cmdIndex, index, value.toLocaleLowerCase());
	            params.push(param);
	            index++;
	        }
	    }
	}
}