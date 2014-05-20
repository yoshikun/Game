package {{packagePath}}
{
	import {{controllerPath}};

	{{#description}}
	/**
	 * {{description}}
	 */
	{{/description}}
	public class {{moduleName}}Controller extends ModuleController
	{
		private static var _instance:{{moduleName}}Controller;
		
		public function {{moduleName}}Controller(moduleName:String=null)
		{
			super(moduleName);
		}
		
		override public function setup():void{
			
		}
		
		override protected function initModel():void{
			super.initModel();
			_model = new {{moduleName}}Model();
		}
		
		override protected function loadResource():void{
			super.loadResource();
			loadResourceNameType("{{moduleName}}");
		}
		
		override protected function initView():void{
			super.initView();
			_view = new {{moduleName}}View(_model);
		}
		
		override protected function initEvent():void{
			super.initEvent();
		}
		
		override protected function showView():void{
			super.showView();
		}
		
		private function get model():{{moduleName}}Model{
			return _model as {{moduleName}}Model;
		}
		
		override public function dispose():void{
			super.dispose();
		}

		public static function get instance():{{moduleName}}Controller{
			if(!_instance){
				_instance = new {{moduleName}}Controller();
			}
			return _instance;
		}
	}
}