package {{packagePath}}
{
	import {{viewPath}};
	import {{modelPath}};
	import flash.display.MovieClip;
	
    public class {{moduleName}}BaseView extends BaseView
    {
    	public function {{moduleName}}BaseView(model:IModel)
    	{
    		super(model);
    	}
    	
		protected function get model():{{moduleName}}Model{
			return _model as {{moduleName}}Model;
		}
    }
}