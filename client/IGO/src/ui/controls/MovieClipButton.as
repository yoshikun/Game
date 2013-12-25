package ui.controls
{
	import com.yo.mvc.core.BaseComponent;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	/**
	 * 定义5帧的动画按钮
	 *  1)up
	 *  2)over
	 *  3)click
	 *  4)selected
	 *  5)disable
	 */	
	public class MovieClipButton extends BaseComponent
	{
		/**
		 * 是否选中 
		 */		
		private var _selected:Boolean;
		
		/**
		 * 是否可用 
		 */		
		private var _enabled:Boolean = true;
		
		/**
		 * 是否灰掉 
		 */	
		private var _gray:Boolean = false;
		
		public function MovieClipButton(asset:MovieClip)
		{
			_asset = asset;
		}
		
		
		override protected function initView():void{
			this.addChild(_asset);
		}
		
		override protected function initEvent():void{
			this.addEventListener(MouseEvent.CLICK, __clickHandler);
			this.addEventListener(MouseEvent.ROLL_OVER, __rollOverHandler);
			this.addEventListener(MouseEvent.ROLL_OUT, __rollOutHandler);
		}
		
		private function __rollOutHandler(e:MouseEvent):void
		{
			_asset.gotoAndStop(ButtonState.MOUSE_UP);
		}
		
		private function __rollOverHandler(e:MouseEvent):void
		{
			_asset.gotoAndStop(ButtonState.ROLL_OVER);
		}
		
		private function __clickHandler(e:MouseEvent):void
		{
			_asset.gotoAndStop(ButtonState.ROLL_OUT);
		}
		
		private function removeEvent():void{
			this.removeEventListener(MouseEvent.CLICK, __clickHandler);
			this.removeEventListener(MouseEvent.ROLL_OVER, __rollOverHandler);
			this.removeEventListener(MouseEvent.ROLL_OUT, __rollOutHandler);
		}

		public function get selected():Boolean
		{
			return _selected;
		}

		public function set selected(value:Boolean):void
		{
			if(_enabled){
				_selected = value;
				_asset.gotoAndStop(value ? ButtonState.SELECTED : ButtonState.MOUSE_UP);
			}
		}

		public function get enabled():Boolean
		{
			return _enabled;
		}

		public function set enabled(value:Boolean):void
		{
			_enabled = value;
			
			if(value){
				_asset.gotoAndStop(ButtonState.MOUSE_UP);
				initEvent();
			}else{
				_asset.gotoAndStop(ButtonState.DISABLE);
				removeEvent();
			}
		}

		public function get gray():Boolean
		{
			return _gray;
		}

		public function set gray(value:Boolean):void
		{
			_gray = value;
			
		}
	}
}