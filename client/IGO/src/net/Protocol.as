package net
{
    import com.yo.net.IProtocol;
    import com.yo.net.IResponse;
	import net.response.system.LoginResponse;
	import net.response.system.LoginGateResponse;
	import net.request.system.LoginRequest;
	import net.request.system.LoginGateRequest;
	public class Protocol implements IProtocol
	{
		private static var _protoMap:Object = {
		
		};
		
		/**
		 * 登录到登陆服返回结果
		 */
		public static const LOGIN:String = 1 + ":" + 2;
		
		/**
		 * 登录到网关返回结果
		 */
		public static const LOGIN_GATE:String = 1 + ":" + 4;
		
		public function Protocol()
		{
			register();
		}
		
		/**
		 * 查找协议 
		 */        
		public function lookup(module:uint, action:uint):IResponse {
		    var c:Class = _protoMap[module + ":" + action];
		    if(!c){
		        return null;
		    }
			return new c;//
		}
		
		/**
		 * 注册协议 
		 */    
		public function register():void {
			_protoMap[LOGIN] = LoginResponse;
			_protoMap[LOGIN_GATE] = LoginGateResponse;
			}
	}
}