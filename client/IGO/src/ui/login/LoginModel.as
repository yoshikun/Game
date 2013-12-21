package ui.login
{
	import com.yo.mvc.interfaces.IModel;
	
	public class LoginModel implements IModel
	{
		public var account:String;
		
		public var password:String;
		
		public function LoginModel()
		{
		}
		
		public function dispose():void
		{
		}
	}
}