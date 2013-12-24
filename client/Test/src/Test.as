package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	public class Test extends Sprite
	{
		public function Test()
		{
			if(stage){
				init();
			}else{
				this.addEventListener(Event.ADDED_TO_STAGE, __addedToStage);
			}
		}
		
		protected function __addedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, __addedToStage);
			
			init();
		}
		
		private function init():void{
			trace(getCompilationDate());
		}
		
		/**
		 * 编译时间
		 */		
		protected function getCompilationDate():Date {
			var swf:ByteArray = stage.loaderInfo.bytes;
			if (!swf){
				return new Date();
			}
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
	}
}