package {{packagePath}}
{
	import {{itemPath}};
	import flash.events.MouseEvent;
	
	public class {{moduleName}}Item extends BaseItem
	{
		private var _vo:{{moduleName}}ItemVo;
		
		public function {{moduleName}}Item()
		{
			super();
		}
		
		override protected function initModel():void{
			super.initModel();
		}
		
		override protected function initView():void{
			super.initView();
		}
		
		override protected function initEvent():void{
			super.initEvent();
			this.addEventListener(MouseEvent.MOUSE_OVER, __mouseOverHandler);
			this.addEventListener(MouseEvent.MOUSE_OUT, __mouseOutHandler);
		}
		
		protected function __mouseOutHandler(e:MouseEvent):void
		{

		}
		
		protected function __mouseOverHandler(e:MouseEvent):void
		{
			
		}
		
		override public function update():void{
			super.update();
			
			if(_vo){
			
			}else{
			
			}
		}

		public function get vo():{{moduleName}}ItemVo
		{
			return _vo;
		}

		public function set vo(value:{{moduleName}}ItemVo):void
		{
			_vo = value;
			update();
		}
		
		override public function dispose():void{
			super.dispose();
			
			this.removeEventListener(MouseEvent.MOUSE_OVER, __mouseOverHandler);
			this.removeEventListener(MouseEvent.MOUSE_OUT, __mouseOutHandler);
		}
	}
}