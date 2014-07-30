package com.yo.framework.objects
{
	import com.yo.framework.objects.animation.AnimationFrameInfo;
	import com.yo.framework.objects.animation.AnimationInfo;
	import com.yo.framework.utils.Vector2D;
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	
	/**
	 * 精灵表 
	 */    
	public class SpriteSheet
	{
		private var _name:String;
		
		private var _texture:BitmapData;
		
		private var _frames:Vector.<AnimationFrameInfo>;
		
		private var _info:AnimationInfo;
		
		public var refCount:int = 0;
		
		private static var _spriteSheets:Dictionary = new Dictionary();
		
		public function SpriteSheet(name:String, texture:*, data:XML)
		{
			_name = name;
			_texture = texture;
			parse(data);
		}
		
		public static function getSpriteSheet(name:String):SpriteSheet{
			return _spriteSheets[name];
		}
		
		public static function addSpriteSheet(name:String, bd:BitmapData, data:XML):SpriteSheet{
			var spriteSheet:SpriteSheet = _spriteSheets[name];
			if(spriteSheet == null){
				_spriteSheets[name] = spriteSheet = new SpriteSheet(name, bd, data);
			}else{
				if(bd){
					bd.dispose();
				}
			}
			spriteSheet.refCount++;
//			Log.getLog(SpriteSheet).debug("增加精灵引用计数", spriteSheet.name, spriteSheet.refCount);
			return spriteSheet;
		}
		
		public static function dump():void {
			trace("当前精灵表内容");
			var count:int = 0;
			var totalSize:int = 0;
			for (var name:String in _spriteSheets) {
				var sprite:SpriteSheet = _spriteSheets[name];
				var size:Number = 0;
				for each (var info:AnimationFrameInfo in sprite._frames) {
					size += info.texture.width * info.texture.height * 4 / 1024;
				}
				trace(name + " 大小: " + size);
				totalSize += size;
				count++;
			}
			trace("总数:" + count + "(" + totalSize + "kb)" + "======");
		}
		
		public static function purge():void {
			for (var name:String in _spriteSheets) {
				var sprite:SpriteSheet = _spriteSheets[name];
				sprite.dispose();
				sprite = null;
				delete _spriteSheets[name];
			}
			_spriteSheets = new Dictionary();
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function set name(value:String):void
		{
			_name = value;
		}
		
		public function clearTexture():void {
			if (_texture) {
				_texture.dispose();
				_texture = null;
			}
		}
		
		public function parse(animationXML:XML):void
		{
			_info = new AnimationInfo();
			_info.zindex = String(animationXML.@zindex);
			_info.pos = String(animationXML.@pos);
			_info.attack = parseInt(animationXML.@attack);
			_info.delay = animationXML.@delay
			_info.loop = (animationXML.@loop == "true" ? true : false);
			
			var framesXML:XMLList = animationXML.frame;
			var pointsNames:Array = ["head", "hand", "body", "gravity", "shoot"];
			_frames = new Vector.<AnimationFrameInfo>();
			
			if(_texture){
				_texture.lock();
			}
			var lastRect:Rectangle;
			for each (var frameXML:XML in framesXML){
				var frameInfo:AnimationFrameInfo = new AnimationFrameInfo();
				frameInfo.frameIndex = frameXML.@frameIndex;
				frameInfo.textureIndex = frameXML.@textureIndex;
				frameInfo.registrationX = frameXML.@registrationX;
				frameInfo.registrationY = frameXML.@registrationY;
				
				for each (var pointName:String in pointsNames) 
				{
					frameInfo[pointName] = getVector2D(frameXML, pointName);
				}
				
				if(_texture){
					var rect:Rectangle = new Rectangle(frameXML.@x, frameXML.@y, frameXML.@width, frameXML.@height);
					
					if(lastRect && rect.equals(lastRect)){
						texture = _frames[_frames.length - 1].texture;
					}else{
						var texture:BitmapData = new BitmapData(rect.width, rect.height, true, 0x0);
						texture.copyPixels(_texture as BitmapData, rect, new Point(0, 0));
					}
					frameInfo.texture = texture;
					lastRect = rect;
				}
				_frames.push(frameInfo);
			}
			if(_texture){
				_texture.unlock();
			}
			_texture && _texture.dispose();
			_info.totalFrames = _frames.length;
		}
		
		/**
		 * 获取每帧中点的位置
		 */		
		private function getVector2D(frameXML:XML, pointName:String):Vector2D{
			var str:String = frameXML.@[pointName];
			if(str){
				return new Vector2D(frameXML.@[pointName].split(";")[0], frameXML.@[pointName].split(";")[1])
			}
			return new Vector2D();
		}
		
		public function getFrames():Vector.<AnimationFrameInfo>{
			return _frames;
		}
		
		public function get info():AnimationInfo{
			return _info;
		}
		
		public function getTile(rect:Rectangle):*
		{
			return new BitmapData(60, 60, true, 0);
		}
		
		public function dispose():void{
			refCount--;
//			_log.debug("减少精灵引用计数", name, refCount);
			if (refCount <= 0){
				delete _spriteSheets[name];
//				_log.debug("清理精灵图片", name);
				
				clearTexture();
				
				for each (var i:AnimationFrameInfo in _frames) {
//					ProfilerManager.instance.recorder("SpriteSheet", -i.texture.width * i.texture.height * 32 / 1024 / 1024, "mb", false);
					i.texture && i.texture.dispose();
					i = null;
				}				
				_frames = null;
			}
		}
	}
}