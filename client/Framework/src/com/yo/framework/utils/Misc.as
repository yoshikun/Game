package com.yo.framework.utils
{
	import com.yo.framework.core.FP;
	import com.yo.framework.mvc.interfaces.IDisposable;
	
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.filters.BitmapFilter;
	import flash.geom.Matrix;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import flash.utils.Endian;
	
	public class Misc
	{
		public static function addFilter(d:DisplayObject, f:BitmapFilter):int {
			var t:Array = d.filters;
			t.push(f);
			d.filters = t;
			return d.filters.length - 1;
		}
		
		public static function rmFilter(d:DisplayObject, i:int):void {
			var t:Array = d.filters;
			t.splice(i, 1);
			d.filters = t;
		}
        
        public static function length(o:Object):int 
        {
            var n:int = 0;
            for (var key:* in o) {
                n++;
            }
            return n;
        }
		
		public static function flipHoriz(oldBitmapData:BitmapData):BitmapData {
			// 水平翻转
			var matrix:Matrix = new Matrix();
			matrix.scale(-1, 1);
			matrix.translate(oldBitmapData.width, 0);
				
			var bitmapData:BitmapData = new BitmapData(oldBitmapData.width, oldBitmapData.height, true, 0x00000000);
			bitmapData.draw(oldBitmapData, matrix);
            return bitmapData;
        }
		
        public static function cosd(angle:Number):Number
        {
            return Math.cos(angle * Math.PI / 180);
        }
		
        public static function sind(angle:Number):Number
        {
            return Math.sin(angle * Math.PI / 180);
        }
        
        public static function hexDump(b:ByteArray):void {
            var table:Array = [
                "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"
            ]
            var oldpos:int = b.position;
            var output:String = '';
            b.position = 0;
            
            for (var i:int = 0; i < b.length; i++)
            {
                var byte:uint = b.readUnsignedByte();
                
                output += table[byte >> 4];
                output += table[byte & 0xF];
                output += ' ';
            }
            
            b.position = oldpos;
            trace(output);
        }
		
		public static function getCompilationDate():Date {
			var swf:ByteArray = FP.stage.loaderInfo.bytes;
			if (!swf) return new Date();
			swf.endian = Endian.LITTLE_ENDIAN;
			
			// Signature + Version + FileLength + FrameSize + FrameRate + FrameCount
			swf.position = 3 + 1 + 4 + (Math.ceil(((swf[8] >> 3) * 4 - 3) / 8) + 1) + 2 + 2;
			
			while (swf.position != swf.length) {
				var tagHeader:uint = swf.readUnsignedShort();
				if (tagHeader >> 6 == 41) {
					// ProductID + Edition + MajorVersion + MinorVersion + BuildLow + BuildHigg
					swf.position += 4 + 4 + 1 + 1 + 4 + 4;
					var milli:Number = swf.readUnsignedInt();
					var date:Date = new Date();
					date.setTime(milli + swf.readUnsignedInt() * 4294967296);
					return date;
				} else {
					swf.position += (tagHeader & 63) != 63 ? (tagHeader & 63) : swf.readUnsignedInt() + 4;
				}
			}
			
			return new Date();
		}
		
		public static function countKeys(myDictionary:Dictionary):int 
		{
			var n:int = 0;
			for (var key:* in myDictionary) {
				n++;
			}
			return n;
		}
		
		public static function removeValueFromArray(arr:*, value:Object):void
		{
			var len:uint = arr.length;
			
			for(var i:Number = len; i > -1; i--)
			{
				if(arr[i] === value)
				{
					arr.splice(i, 1);
				}
			}					
		}
		
		public static function clearContainer(parent:DisplayObjectContainer):void {
			if(!parent){
				return;
			}
			var len:int = parent.numChildren - 1;
			for (var i:int = len; i >= 0; i--) 
			{
				var child:DisplayObject = parent.getChildAt(i);
				if(!child) {
					continue;
				}
				if (child is DisplayObjectContainer) {
					clearContainer(DisplayObjectContainer(child));
				}
				clear(child);
				if(child.parent){
					child.parent.removeChild(child);
				}
			}
			clear(parent, false);
		}
		
		public static function removeChildren(parent:DisplayObjectContainer):void {
			if(parent){
				while(parent.numChildren > 0) {
					parent.removeChildAt(0);
				}
			}
		}
		
		private static function clear(child:DisplayObject, isCallDispose:Boolean = true):void{
			if (isCallDispose) {
				if(child is IDisposable){
					IDisposable(child).dispose();
				}
				else if(child){
					if (child.hasOwnProperty('dispose') && child['dispose'] is Function) {
						child['dispose']();
					}
				}
			}
//			if(child.parent){
//				child.parent.removeChild(child);
//			}
				
			if (child is MovieClip) {
				MovieClip(child).stop();
			}
		}
		
		public static function replace(d1:DisplayObject, d2:DisplayObject):void{
			d1.x = d2.x;
			d1.y = d2.y;
			
			if(d2.parent){
				d2.parent.removeChild(d2);
			}
		}
		
		public static function isTextFieldFocus():Boolean {
			return (FP.stage.focus is TextField && TextField(FP.stage.focus).type == TextFieldType.INPUT);
		}
		
		public static function setProperty(mc:MovieClip, name:String, properties:Object):void {
			for (var i:int = 1; i <= mc.totalFrames; ++i) {
				mc.addFrameScript(i - 1, function ():void {
					for (var key:String in properties) {
						if (mc[name]) {
							mc[name][key] = properties[key];
						}
					}
				});
				mc.gotoAndStop(i);
			}
		}
	}

}