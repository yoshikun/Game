package net
{
    import com.yo.net.IProtocol;
    import com.yo.net.IResponse;
	
	public class Protocol implements IProtocol
	{
		private static var _protoMap:Object = {
		
		};
		
		public function Protocol():void{
			register();
		}
		
		/**
		 * 注册协议 
		 */    
		private function register():void {
			_protoMap[_key(LOGIN_GATE)] = LoginGateResponse;
		}
		
		/**
		 * 登录到网关返回结果
		 */
		public static const LOGIN_GATE:Object = {
			module: 1,
			action: 4, request:LoginGateRequest//
		};
		
		/**
		 * 查找协议 
		 */        
		public function lookup(module:uint, action:uint):IResponse{
			var c:Class = _protoMap[_toString(module, action)];
			if(!c){
				return null;
			}
			return new c;
		}
		
		private static function _key(o:Object):String {
			return _toString(o.module, o.action);
		}
		
		private static function _toString(module:uint, action:uint):String {
			return module + ':' + action;
		}
	}
}