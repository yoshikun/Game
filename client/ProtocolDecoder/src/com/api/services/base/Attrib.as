package com.api.services.base
{
public class Attrib
{
	public var data:XML;
	public var value:String;
	public var type:String;
	public var info:String;
	public var consts:String;
	
    public function Attrib(xml:XML)
    {
        this.data = xml;
        this.value = data.@value;
        this.type = data.@type;
        this.info = data.@info;
        this.consts = xml.@consts;
    }

	public function isArrayValue():Boolean
    {
        return value.indexOf("[") != -1;
    }
    
    public function getArrayValue():String
    {
        return value.slice(0, value.indexOf("["));
    }
    
    public function getArrayParamName():String
    {
        return getArrayValue() + ConstMap.ARRAY_SUF;
    }
    
    public function getArrayLenName():String
    {
        return value.slice(value.indexOf("[") + 1, value.indexOf("]"));
    }
    
    public function isVOType():Boolean
    {
        return type.indexOf("@") != -1;
    }
	
	public function getVOName():String{
		var clearType:String = getCleardType();
		return clearType.charAt(0).toLocaleLowerCase() + clearType.slice(1);
	}
    
    public function getCleardType():String
    {
        if(isVOType())
        {
            return type.slice(1);
        }
        else
        {
            return type;
        }
    }
}
}