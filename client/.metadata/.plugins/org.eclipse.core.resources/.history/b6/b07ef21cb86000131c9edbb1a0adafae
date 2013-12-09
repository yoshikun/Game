package com.yile.games.doll.net
{
    import com.yile.framework.net.IProtocol;
    import com.yile.framework.net.IResponse;
	{{#data}}
	import com.yile.games.doll.net.response.{{subPath}}.{{responseClassName}};
	{{/data}}
	{{#data}}{{#requestClassName}}
	import com.yile.games.doll.net.request.{{subPath}}.{{requestClassName}};
	{{/requestClassName}}{{/data}}
	
	public class Protocol implements IProtocol
	{
		private static var _protoMap:Object = {
		
		};
		
		{{#data}}
		/**
		 * {{info}}
		 */
		public static const {{value}}:Object = {
			module: {{cmdIndex}},
			action: {{paramIndex}}{{#requestClassName}}, request:{{requestClassName}}{{/requestClassName}}//
		};
		
		{{/data}}
		public function Protocol()
		{
		
		}
		
		/**
		 * 查找协议 
		 */        
		public function lookup(module:uint, action:uint):IResponse {
		    var c:Class = _protoMap[_toString(module, action)];
		    if (! c) {
		        return null;
		    }
			return new c;
		}
		
		/**
		 * 注册协议 
		 */    
		public function register():void {
			{{#data}}
			_protoMap[_key({{value}})] = {{responseClassName}};
			{{/data}}
		}
		
		private static function _key(o:Object):String {
			return _toString(o.module, o.action);
		}
		
		private static function _toString(module:uint, action:uint):String {
			return module + ':' + action;
		}
	}
}