package com.yo.framework.manager
{
    import flash.display.*;
    import flash.events.ContextMenuEvent;
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.geom.*;
    import flash.net.*;
    import flash.system.*;
    import flash.ui.*;
    import flash.utils.*;
    
    public class ProfilerManager
    {
        private var startTime:int;
        public var initTime:int;
        private var currentTime:int;
        private var frameCount:int;
        private var totalCount:int;
        public var minFps:Number;
        public var maxFps:Number;
        public var minMem:Number;
        public var maxMem:Number;
        public var history:int = 60;
        public var fpsList:Array = [];
        public var memList:Array = [];
        public var displayed:Boolean = false;
        private var started:Boolean = false;
        private var inited:Boolean = false;
        private var frame:Sprite;
        public var stage:Stage;
        public var content:ProfilerContent;
        private var frameConstructedCounter:int;
        private var frameConstructedTime:int;
        private var enterFrameTime:int;
        private var exitFrameTime:int;
        private var frameActionExecuted:int;
        private var ConstructorCodeExecuted:int;
        private var renderTime:int;
        
        private static var _instance:ProfilerManager;
        private var benchmarks:Dictionary;
        private var recorders:Dictionary;
        
        public function ProfilerManager() {
        }
        
        public static function get instance():ProfilerManager
        {
            if(!_instance){
                _instance = new ProfilerManager();
            }
            return _instance;
        }

        public function menuHandler(e:ContextMenuEvent):void
        {
            if (stage.displayState != flash.display.StageDisplayState.NORMAL)
            {
                e.target.customItems[0].enabled = false;
                e.target.customItems[1].enabled = true;
            }
            else 
            {
                e.target.customItems[0].enabled = true;
                e.target.customItems[1].enabled = false;
            }
            return;
        }

        public function init(s:Stage):void
        {
            if (inited)
            {
                return;
            }
            inited = true;
            stage = s;
            content = new ProfilerContent();
            benchmarks = new Dictionary();
			recorders = new Dictionary();
            frame = new Sprite();
            minFps = Number.MAX_VALUE;
            maxFps = Number.MIN_VALUE;
            minMem = Number.MAX_VALUE;
            maxMem = Number.MIN_VALUE;
            start();
        }
		
		public function recorder(name:String, value:Number, unit:String, temp:Boolean = true):void {
			var recorder:Recorder = recorders[name];
			if (! recorder) {
				recorders[name] = recorder = new Recorder();
			}
			recorder.name = name;
			recorder.value += value;
			recorder.unit = unit;
			recorder.temp = temp;
		}
        
        public function benchmarkStart(name:String):void {
            var benchmark:Benchmark = benchmarks[name];
            if (! benchmark) {
                benchmarks[name] = benchmark = new Benchmark();
            }
            benchmark.startTime = getTimer();
            benchmark.name = name;
        }
        
        public function benchmarkEnd(name:String):void {
            var benchmark:Benchmark = benchmarks[name];
            benchmark.runningTime += getTimer() - benchmark.startTime;
            benchmark.count ++;
        }
        
        public function setContent(name:String, value:String):void {
            content.setContent(name, value);
        }

        public function start():void
        {
            if (started)
            {
                return;
            }
            started = true;
            var currentTime:int;
            startTime = currentTime = flash.utils.getTimer();
            initTime = currentTime;
            frameCount = currentTime = 0;
            totalCount = currentTime;
            
            // Elastic Racetrack
            // 1. Player Event (ENTER_FRAME, MOUSE_EVENT, URLLoader etc.)
            // 2. Event code 
            // 3. RENDER Event (user code exec stage.invalidate())
            // 4. RENDER event code (final user code)
            // 5. Change to display
            
            addEvent(frame, Event.ENTER_FRAME, render);
            
            addEvent(frame, Event.FRAME_CONSTRUCTED, onFrameConstructed);
            addEvent(frame, Event.EXIT_FRAME, onExitFrame);
            addEvent(frame, Event.RENDER, onRender);
        }
        
        private function onRender(e:Event):void
        {
            renderTime = getTimer() - startTime;
        }
        
        private function onExitFrame(e:Event):void
        {
            exitFrameTime = getTimer() - startTime;
            frameActionExecuted = exitFrameTime - frameConstructedTime;
        }
        
        private function onFrameConstructed(e:Event):void
        {
            frameConstructedCounter++;
            frameConstructedTime = getTimer() - startTime;
            ConstructorCodeExecuted = frameConstructedTime - enterFrameTime;
        }
        
        public function stop():void
        {
            if (!started)
            {
                return;
            }
            started = false;
            removeEvent(frame, Event.ENTER_FRAME, render);
            
            removeEvent(frame, Event.FRAME_CONSTRUCTED, onFrameConstructed);
            removeEvent(frame, Event.EXIT_FRAME, onExitFrame);
            removeEvent(frame, Event.RENDER, onRender);
        }

        public function get currentFps():Number
        {
            return frameCount / intervalTime;
        }

        public function get currentMem():Number
        {
            return flash.system.System.totalMemory / 1024 / 1024;
        }

        public function get averageFps():Number
        {
            return totalCount / runningTime;
        }

        public function get runningTime():Number
        {
            return (currentTime - initTime) / 1000;
        }

        private function get intervalTime():Number
        {
            return (currentTime - startTime) / 1000;
        }

        public function toggleDisplay():void
        {
            if (displayed) {
                hide();
            }
            else {
                show();
            }
        }

        public function show():void
        {
            displayed = true;
            addEvent(stage, Event.RESIZE, resize);
            stage.addChild(content);
            updateDisplay();
        }

		public function hide():void
        {
            displayed = false;
            removeEvent(stage, Event.RESIZE, resize);
            stage.removeChild(content);
        }

        private function resize(e:Event):void
        {
            content.update(runningTime, minFps, maxFps, minMem, maxMem, currentFps, currentMem, averageFps, fpsList, memList, history);
            return;
        }

        public function render(e:Event):void
        {
            currentTime = flash.utils.getTimer();
            enterFrameTime = currentTime - startTime;
            frameCount++;
            totalCount++;
            
            // 一秒更新一次
            if (intervalTime >= 1)
            {
                if (displayed)
                {
                    updateDisplay();
                }
                else 
                {
                    updateMinMax();
                }
                fpsList.unshift(currentFps);
                memList.unshift(currentMem);
                if (fpsList.length > history)
                {
                    fpsList.pop();
                }
                if (memList.length > history)
                {
                    memList.pop();
                }
                startTime = currentTime;
                frameCount = 0;
                
                
                // 更新基准测试
                for each (var benchmark:Benchmark in benchmarks) {
                    content.setContent(benchmark.name, benchmark.runningTime + 'ms(' + benchmark.count + ')');
                    benchmark.reset();
                }
				
				// 更新记录器
				for each (var recorder:Recorder in recorders) {
					content.setContent(recorder.name, recorder.value.toFixed(1) + ' ' + recorder.unit);
					if (recorder.temp) {
						recorder.reset();
					}
				}
            }
        }

        private function updateDisplay():void
        {
            updateMinMax();
            content.update(runningTime, minFps, maxFps, minMem, maxMem, currentFps, currentMem, averageFps, fpsList, memList, history);
            return;
        }

        private function updateMinMax():void
        {
            minFps = Math.min(currentFps, minFps);
            maxFps = Math.max(currentFps, maxFps);
            minMem = Math.min(currentMem, minMem);
            maxMem = Math.max(currentMem, maxMem);
            return;
        }

        private function addEvent(e:EventDispatcher, eventType:String, func:Function):void
        {
            e.addEventListener(eventType, func, false, 0, true);
            return;
        }

        private function removeEvent(e:EventDispatcher, eventType:String, func:Function):void
        {
            e.removeEventListener(eventType, func);
            return;
        }

    }
}


import flash.display.*;
import flash.events.Event;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.utils.Dictionary;
import flash.utils.getTimer;



class ProfilerContent extends Sprite
{
    
    private var minFpsTxtBx:TextField;
    private var maxFpsTxtBx:TextField;
    private var minMemTxtBx:TextField;
    private var maxMemTxtBx:TextField;
    private var infoTxtBx:TextField;
    private var box:flash.display.Shape;
    private var fps:flash.display.Shape;
    private var mb:flash.display.Shape;
    
    /**
     * 自定义的概览 
     */    
    private var content:Dictionary;
    
    public function ProfilerContent()
    {
        this.content = new Dictionary();
        this.fps = new Shape();
        this.mb = new Shape();
        this.box = new Shape();
        this.mouseChildren = false;
        this.mouseEnabled = false;
        this.fps.x = 65;
        this.fps.y = 45;
        this.mb.x = 65;
        this.mb.y = 90;
        var tf:TextFormat = new TextFormat("_sans", 9, 0xAAAAAA);
        this.infoTxtBx = new TextField();
        this.infoTxtBx.autoSize = TextFieldAutoSize.LEFT;
        this.infoTxtBx.defaultTextFormat = new TextFormat("_sans", 11, 0xCCCCCC);
        this.infoTxtBx.y = 98;
        this.minFpsTxtBx = new TextField();
        this.minFpsTxtBx.autoSize = TextFieldAutoSize.LEFT;
        this.minFpsTxtBx.defaultTextFormat = tf;
        this.minFpsTxtBx.x = 7;
        this.minFpsTxtBx.y = 37;
        this.maxFpsTxtBx = new TextField();
        this.maxFpsTxtBx.autoSize = TextFieldAutoSize.LEFT;
        this.maxFpsTxtBx.defaultTextFormat = tf;
        this.maxFpsTxtBx.x = 7;
        this.maxFpsTxtBx.y = 5;
        this.minMemTxtBx = new TextField();
        this.minMemTxtBx.autoSize = TextFieldAutoSize.LEFT;
        this.minMemTxtBx.defaultTextFormat = tf;
        this.minMemTxtBx.x = 7;
        this.minMemTxtBx.y = 83;
        this.maxMemTxtBx = new TextField();
        this.maxMemTxtBx.autoSize = TextFieldAutoSize.LEFT;
        this.maxMemTxtBx.defaultTextFormat = tf;
        this.maxMemTxtBx.x = 7;
        this.maxMemTxtBx.y = 50;
        addChild(this.box);
        addChild(this.infoTxtBx);
        addChild(this.minFpsTxtBx);
        addChild(this.maxFpsTxtBx);
        addChild(this.minMemTxtBx);
        addChild(this.maxMemTxtBx);
        addChild(this.fps);
        addChild(this.mb);
        
        this.addEventListener(Event.ADDED_TO_STAGE, this.added, false, 0, true);
        this.addEventListener(Event.REMOVED_FROM_STAGE, this.removed, false, 0, true);
        return;
    }
    
    public function setContent(name:String, value:String):void {
        content[name] = value;
    }

    public function update(runningTime:Number, minFps:Number, maxFps:Number, minMem:Number, maxMem:Number, currentFps:Number, currentMem:Number, averageFps:Number, fpsList:Array, memList:Array, e:int):void
    {
        if (runningTime >= 1)
        {
            this.minFpsTxtBx.text = minFps.toFixed(3) + " Fps";
            this.maxFpsTxtBx.text = maxFps.toFixed(3) + " Fps";
            this.minMemTxtBx.text = minMem.toFixed(3) + " Mb";
            this.maxMemTxtBx.text = maxMem.toFixed(3) + " Mb";
        }
        var text:String = '';
		var list:Array = [];
		for (var name:String in content) {
			list.push(name);
		}
		list.sort();
        for each(var v:String in list) {
            text += (v + ' ' + content[v] + '   |   ');
        }
        text += "Current Fps " + currentFps.toFixed(3) + "   |   Average Fps " + averageFps.toFixed(3) + "   |   Memory Used " + currentMem.toFixed(3) + " Mb";
        this.infoTxtBx.text = text;
        this.infoTxtBx.x = stage.stageWidth - this.infoTxtBx.width - 20;
        var gfx:Graphics = this.fps.graphics;
        gfx.clear();
        gfx.lineStyle(1, 0x33FF00, 0.7);
        var i:int = 0;
        var len:uint = fpsList.length;
        var heightMax:Number = 35;
        var contentWidth:Number = stage.stageWidth - 80;
        var deltaX:Number = contentWidth / (e - 1);
        var d:Number = maxFps - minFps;
		var drawY:Number;
        while (i < len) {
            drawY = (fpsList[i] - minFps) / d;
            if (i != 0) {
                gfx.lineTo(i * deltaX, (-drawY) * heightMax);
            }
            else {
                gfx.moveTo(0, (-drawY) * heightMax);
            }
            ++i;
        }
        
        
        gfx = this.mb.graphics;
        gfx.clear();
        gfx.lineStyle(1, 0x0066FF, 0.7);

        len = memList.length;
        d = maxMem - minMem;
        i = 0;
        while (i < len) {
            drawY = (memList[i] - minMem) / d;
            if (i != 0) {
                gfx.lineTo(i * deltaX, (-drawY) * heightMax);
            }
            else {
                gfx.moveTo(0, (-drawY) * heightMax);
            }
            ++i;
        }
        return;
    }

    private function added(e:Event):void
    {
        this.resize();
        stage.addEventListener(Event.RESIZE, this.resize, false, 0, true);
        return;
    }

    private function removed(e:Event):void
    {
        stage.removeEventListener(Event.RESIZE, this.resize);
        return;
    }

    private function resize(e:Event=null):void
    {
        var gfx:Graphics;
        gfx = this.box.graphics;
        gfx.clear();
        gfx.beginFill(0, 0.5);
        gfx.drawRect(0, 0, stage.stageWidth, 120);
        gfx.lineStyle(1, 0xFFFFFF, 0.2);
        gfx.moveTo(65, 45);
        gfx.lineTo(65, 10);
        gfx.moveTo(65, 45);
        gfx.lineTo(stage.stageWidth - 15, 45);
        gfx.moveTo(65, 90);
        gfx.lineTo(65, 55);
        gfx.moveTo(65, 90);
        gfx.lineTo(stage.stageWidth - 15, 90);
        gfx.endFill();
        this.infoTxtBx.x = stage.stageWidth - this.infoTxtBx.width - 20;
        return;
    }
}

class Benchmark {
    public var startTime:int;
    public var runningTime:int;
    public var count:int;
    public var name:String;
    
    public function Benchmark() {
        reset();
    }
    
    public function reset():void {
        startTime = 0;
        runningTime = 0;
        count = 0;
    }
}

class Recorder {
	public var value:Number = 0;
	public var name:String;
	public var unit:String = 'ms';
	public var temp:Boolean = true;
	
	public function reset():void
	{
		value = 0;
	}
}