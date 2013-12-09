package fl.managers
{
	import flash.system.ApplicationDomain;

	public class SkinManager
	{
		private var _applicationDomain:ApplicationDomain;
			
		private static var _instance:SkinManager;
		
		public function SkinManager()
		{
		}
		
		public function setup():void{
			_applicationDomain = ApplicationDomain.currentDomain;
		}

		public static function get instance():SkinManager
		{
			if(!_instance){
				_instance = new SkinManager();
			}
			return _instance;
		}

		public function get applicationDomain():ApplicationDomain
		{
			return _applicationDomain;
		}
	}
}