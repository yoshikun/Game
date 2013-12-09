package com.yile.games.doll.data.baseData
{
	public class {{className}}
	{
		{{#data}}
		/**
		 * {{propertyInfo}}
		 */		
		public var {{propertyName}}:{{propertyType}};
		
		{{/data}}
		
		public function copyTo(result:Object):void{
			{{#data}}
			result.{{propertyName}} = this.{{propertyName}};
			{{/data}}
		}
	}
}