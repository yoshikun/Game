package com.yo.game.net
{
    import com.yo.framework.net.IProtocol;
    import com.yo.framework.net.IResponse;
	{{#data}}
	import com.yo.game.net.response.{{subPath}}.{{responseClassName}};
	{{/data}}
	{{#data}}{{#requestClassName}}
	import com.yo.game.net.request.{{subPath}}.{{requestClassName}};
	{{/requestClassName}}{{/data}}
	
	public class Protocol implements IProtocol
	{
		private static var _protoMap:Object = {
		
		};
		
		{{#data}}
		/**
		 * {{info}}
		 */
		public static const {{value}}:String = "{{cmdIndex}}:{{paramIndex}}";
		
		{{/data}}
		public function Protocol()
		{
			register();
		}
		
		/**
		 * 查找协议 
		 */        
		public function lookup(module:uint, action:uint):IResponse {
		    var c:Class = _protoMap[_toString(module, action)];
		    if (!c) {
		        return null;
		    }
			return new c;
		}
		
		/**
		 * 注册协议 
		 */    
		public function register():void {
			{{#data}}
			_protoMap[{{value}}] = {{responseClassName}};
			{{/data}}
		}
		
		private static function _toString(module:uint, action:uint):String {
			return module + ":" + action;
		}
	}
}