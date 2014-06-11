package {{packagePath}}
{
	import {{viewPath}};
	import {{modelPath}};
	import flash.display.MovieClip;
	import com.yile.framework.resource.ResourceManager;
	import com.yile.framework.ui.UIManager;
	import com.yile.framework.ui.config.Layers;
	
    public class {{moduleName}}View extends {{moduleName}}BaseView
    {
    	public function {{moduleName}}View(model:IModel)
    	{
    		super(model);
    	}
    	
		override protected function initView():void{
			super.initView();
			
			_asset = ResourceManager.instance.create("") as MovieClip;
			this.addChild(_asset);
		}
		
		override public function show(isCenter:Boolean=true, isModal:Boolean=false):void{
			super.show(isCenter, isModal);
			
			UIManager.instance.addChild(this, Layers.POPUP);
		}
		
		override protected function initEvent():void{
			super.initEvent();
		}
		
		override public function update():void{
			super.update();
		}
		
		override public function dispose():void{
			super.dispose();
		}
    }
}