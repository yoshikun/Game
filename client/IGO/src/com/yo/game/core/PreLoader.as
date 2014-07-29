package com.yo.game.core
{
	import com.yo.framework.utils.Macro;
	
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.system.ApplicationDomain;
	import flash.system.Capabilities;
	import flash.system.LoaderContext;
	import flash.system.System;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.getDefinitionByName;
	
	[SWF(width="1000", height="600", frameRate="30", backgroundColor="#0")]
	public class PreLoader extends MovieClip
	{
//		[Embed(source="Logo.swf", mimeType="application/octet-stream")]
//	    private var Logo:Class;
		
	    private var _loader:Loader;
		private var _logoPlayOver:Boolean = false;
		private var _mainLoaded:Boolean = false;
		private var _mask:Shape;
		private var _progressTf:TextField;
		
		public function PreLoader()
		{
			this.stop();
			
			_mask = new Shape();
			_mask.graphics.clear();
			_mask.graphics.beginFill(0x0, 1);
			_mask.graphics.drawRect(0, 0, 1000, 600);
			_mask.graphics.endFill();
			this.addChild(_mask);
			
//			_loader = new Loader();
//			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoaded);
//			_loader.loadBytes(new Logo(), new LoaderContext(false, ApplicationDomain.currentDomain));
//			this.addChild(_loader);
			
			_logoPlayOver = true;
			
			_progressTf = new TextField();
			var format:TextFormat = new TextFormat();
			format.color = 0xFFFFFF;
			format.size = 14;
			_progressTf.setTextFormat(format);
			_progressTf.defaultTextFormat = format;
			_progressTf.autoSize = TextFieldAutoSize.LEFT;
			this.addChild(_progressTf);
			
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, __onProgress);
			loaderInfo.addEventListener(Event.COMPLETE, __onComplete);
		}

		private function onLoaded(event:Event):void
		{
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onLoaded);
			MovieClip(_loader.content).addFrameScript(MovieClip(_loader.content).totalFrames - 1, onPlayEnd);
		}
		
		public function onPlayEnd():void {
			_logoPlayOver = true;
			MovieClip(_loader.content).stop();
			updateNextFrame();
		}
		
		private function updateNextFrame():void
		{
			if(_logoPlayOver && _mainLoaded)
			{
				initGame();
				
				Macro.saveRemove(_mask);
				Macro.saveRemove(_loader);
				Macro.saveRemove(_progressTf);
			}
		}
		
		private function __onComplete(event:Event):void
		{
			loaderInfo.removeEventListener(ProgressEvent.PROGRESS, __onProgress);
			loaderInfo.removeEventListener(Event.COMPLETE, __onComplete);
			_mainLoaded = true;
			
			updateNextFrame();
		}
		
		private function __onProgress(event:ProgressEvent):void
		{
			var percent:Number = root.loaderInfo.bytesLoaded * 100 / root.loaderInfo.bytesTotal;
			_progressTf.text = "加载中：" + Math.ceil(percent) + '%';
			_progressTf.x = (stage.stageWidth - _progressTf.width) - 10;
			_progressTf.y = (stage.stageHeight - _progressTf.height) - 5;
		}
		
		private function initGame():void {
			nextFrame();
			var mainClass:Class = getDefinitionByName(currentLabel.split("_").join(".")) as Class;
			if(mainClass)
			{
				//此处不能直接调用main的构造函数, 因为那样会涉及到stage, 而stage在被add as child之前还是空
				var app:DisplayObject = new mainClass();
				//主程序对象是作为 MyPreloader 的子对象, 而不是根的子对象
				//这一点和flex preloader不一样
				addChildAt(app, 0);
			}
		}
	}
}