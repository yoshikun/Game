package com.yo.framework.utils
{
	import com.yo.framework.mvc.interfaces.IDisposable;
	
	import flash.display.DisplayObject;

	public class Macro
	{
		public static function saveReplace(source:DisplayObject, target:DisplayObject):void{
			source.x = target.x;
			source.y = target.y;
			
			target.parent.addChildAt(source, target.parent.getChildIndex(target));
			
			if(target.parent){
				target.parent.removeChild(target);
			}
		}
		
		public static function saveRemove(source:DisplayObject):void{
			if(source && source.parent){
				source.parent.removeChild(source);
			}
		}
		
		public static function eatPos(hunter:DisplayObject, animal:DisplayObject):void{
			if(!hunter || !animal){
				return;
			}
			hunter.x = animal.x;
			hunter.y = animal.y;
			
			animal.x = 0;
			animal.y = 0;
		}
		
		public static function dipose(source:IDisposable):void{
			if(source){
				source.dispose();
			}
			source = null;
		}
	}
}