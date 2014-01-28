package com.yo.manager
{
	import br.com.stimuli.loading.loadingtypes.LoadingItem;
	
	import com.yo.logger.Log;
	import com.yo.manager.resource.ResourceManager;
	import com.yo.utils.MathUtil;
	
	import flash.events.Event;
	import flash.events.NetStatusEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundLoaderContext;
	import flash.media.SoundTransform;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	
	import gs.TweenLite;

	public class SoundManager
	{
		private static var _instance:SoundManager;
		
		/**
		 * channel列表 
		 */		
		private var _effectChannels:Array;
		
		private var _netConnection:NetConnection;
		
		private var _netStream:NetStream;
		
		/**
		 * 当前播放 
		 */		
		private var _currentMusicName:String;
		
		/**
		 * 音乐 
		 */		
		private var _allowMusic:Boolean = true;
		
		/**
		 * 是否循环音乐
		 */		
		private var _musicLoop:Boolean = true;
		
		/**
		 * 音乐播放列表 
		 */		
		private var _musicPlayList:Array;
		
		public static const DEFAULT_MUSIC_VOLUME:Number = 30;
		private var _musicVolume:Number = DEFAULT_MUSIC_VOLUME;
		
		/**
		 * 音效 
		 */
		private var _allowSound:Boolean = true;
		
		private var _currentSoundName:String;
		
		private var _soundLoop:int;
		
		public static const DEFAULT_SOUND_VOLUME:Number = 50;
		private var _soundVolume:Number = DEFAULT_SOUND_VOLUME;
		private var _log:Log;
		
		private var _musicTransform:SoundTransform;
		
		private var _tweenLite:TweenLite;
		
		public function SoundManager()
		{
			init();
		}
		
		/**
		 * 音效音量 
		 */
		public function set soundVolume(value:Number):void
		{
			_soundVolume = value;
			update();
		}

		/**
		 * 音乐音量 
		 */
		public function set musicVolume(value:Number):void
		{
			_musicVolume = value;
			update();
		}

		private function init():void{
			_effectChannels = [];
			
			_musicPlayList = [];
			
			_log = Log.getLog(this);
			
			_netConnection = new NetConnection();
			_netConnection.connect(null);
			
			_netStream = new NetStream(_netConnection);
			_netStream.bufferTime = 0.3;
			_netStream.client = this;
			_netStream.addEventListener(NetStatusEvent.NET_STATUS, __netStatus);
			
			_musicTransform = new SoundTransform(0);
		}
		
		/**
		 * 停止以后播放列表中其他的音乐
		 */		
		private function __netStatus(e:NetStatusEvent):void
		{
			if(e.info.code == "NetStream.Play.Stop"){
				if(_musicLoop){
					playMusicImp(_musicPlayList,true);
				}else {
//					_musicPlayList.shift();循环播放，不进行两遍后随机
					if(_musicPlayList.length > 0){
						playMusicImp(_musicPlayList,false);
					}else{
						var index:int = MathUtil.rand(0, _musicPlayList.length - 1);
						playMusicImp([_musicPlayList[index]], false);
					}
				}
			}
		}
		
		/**
		 * 播放音效, 如果没有就加载
		 */		
		public function play(name:String, allowMulti:Boolean = false, replaceSame:Boolean = true, loops:int = 0):void
		{
			if(_allowSound){
				if(allowMulti || replaceSame)
				{
					_currentSoundName = name;
					_soundLoop = loops;
					
					ResourceManager.instance.loadResource(name, "sound", __loadComplete, new SoundLoaderContext());
				}
			}
		}
		
		public function thinOut():void{
			killTweenLite();
			_tweenLite = TweenLite.to(_musicTransform, 3, {volume:0, onUpdate:onUpdate, onComplete:onComplete});
		}
		
		private function onUpdate():void{
			_netStream.soundTransform = _musicTransform;
		}
		
		private function onComplete():void{
			stopMusic();
		}
		
		public function thinIn():void{
			killTweenLite();
			_tweenLite = TweenLite.to(_musicTransform, 3, {volume:_musicVolume, onUpdate:onUpdate, onComplete:onComplete});
		}
		
		private function killTweenLite():void{
			if(_tweenLite){
				_tweenLite.kill();
			}
		}
		
		private function solveSoundPath(name:String):String{
			var path:String = name.replace("_", "/");
			return path;
		}
		
		/**
		 * 音效是否正在播放
		 */		
		public function isPlaying(value:String):Boolean
		{
			return false;
		}
		
		public function playMusic(list:Array, replace:Boolean = true, loop:Boolean = true):void{
			if (replace) {
				stopMusic();
			}
			_log.info("播放音乐", list);
			playMusicImp(list, loop);
		}
		
		public function stopMusic():void
		{
			if(_currentMusicName)
			{
				_netStream.close();
				_currentMusicName = null;
			}
		}
		
		public function getCurrentMusic():String {
			return _currentMusicName;
		}
		
		public function getMusicList():Array {
			return _musicPlayList
		}
		
		private function playSoundImp(name:String, loops:int):void
		{
			var sound:Sound = ResourceManager.instance.getResource(_currentSoundName, "sound") as Sound;
			if (!sound) {
				_log.warn("音乐文件不存在", _currentSoundName);
				return;
			}
				
			var channel:SoundChannel = sound.play(0, loops, new SoundTransform(_soundVolume / 100));
			if(channel){
				channel.addEventListener(Event.SOUND_COMPLETE,__soundComplete);
				_effectChannels.push(channel);
			}
		}
		
		private function __loadComplete(e:Event):void
		{
			var item:LoadingItem = e.currentTarget as LoadingItem;
			item.removeEventListener(Event.COMPLETE, __loadComplete);
			
			playSoundImp(_currentSoundName, _soundLoop);
		}
		
		private function playMusicImp(list:Array, loops:Boolean):void
		{
			killTweenLite();
			
			_musicLoop = loops;
			_musicPlayList = list;
			
			if(list.length > 0){
				_currentMusicName = list[0];
				_currentMusicName = ResourceManager.instance.getResourceName(_currentMusicName, "music");
				var url:String = ResourceManager.instance.getResourceUrl(_currentMusicName, "music");
				url = url.split("?")[0];
				
				_musicTransform.volume = 0;
				_netStream.soundTransform = _musicTransform;
				_netStream.play(url);
				Global.stage.addEventListener(Event.ENTER_FRAME, onEnter);
				
				if(!_allowMusic){
					_netStream.removeEventListener(NetStatusEvent.NET_STATUS, __onMusicStaus);
					pauseMusic();
				}else{
					_netStream.addEventListener(NetStatusEvent.NET_STATUS, __onMusicStaus);
				}
			}
		}
		
		protected function onEnter(event:Event):void
		{
			if(_musicTransform.volume * 100 < _musicVolume) {
				_musicTransform.volume += 0.02;
				_netStream.soundTransform = _musicTransform;
			}else{
				_musicTransform.volume = _musicVolume / 100;
				_netStream.soundTransform = _musicTransform;
				Global.stage.removeEventListener(Event.ENTER_FRAME, onEnter);
			}
		}
		
		private function __onMusicStaus(e:NetStatusEvent):void
		{
			if(e.info.code == "NetConnection.Connect.Failed" || e.info.code == "NetStream.Play.StreamNotFound"){
				_netStream.removeEventListener(NetStatusEvent.NET_STATUS,__onMusicStaus);
			}else if (e.info.code == "NetStream.Play.Start"){
				_netStream.removeEventListener(NetStatusEvent.NET_STATUS,__onMusicStaus);
			}
		}
		
		public function onMetaData(info:Object):void {
			
		}
		
		public function pauseMusic():void
		{
			_netStream.pause();
		}
		
		/**
		 * 音乐播放完毕
		 */		
		private function __soundComplete(e:Event):void
		{
			var channel:SoundChannel = e.currentTarget as SoundChannel;
			channel.removeEventListener(Event.SOUND_COMPLETE,__soundComplete);
			channel.stop();
			var index:int = _effectChannels.indexOf(channel);
			_effectChannels.splice(index, 1);
		}
		
		/**
		 * 停止播放音效
		 */		
		public function stop(value:String):void
		{
		}
		
		public function unmute():void{
			_musicVolume = DEFAULT_MUSIC_VOLUME;
			_soundVolume = DEFAULT_SOUND_VOLUME;
			update();
		}
		
		public function mute():void{
			_musicVolume = 0;
			_soundVolume = 0;
			
			update();
		}
		
		private function update():void
		{
			for each(var channel:SoundChannel in _effectChannels) {
				if(channel)
				{
					channel.soundTransform.volume = _soundVolume;
				}
			}
			_musicTransform.volume = _musicVolume / 100;
			_netStream.soundTransform = _musicTransform;
		}
		
		/**
		 *停止播放所有音效 
		 */		
		public function stopAllSound():void
		{
			for each(var channel:SoundChannel in _effectChannels)
			{
				if(channel)
				{
					channel.stop();
				}
			}
			_effectChannels = [];
		}

		public static function get instance():SoundManager
		{
			if(!_instance){
				_instance = new SoundManager();
			}
			return _instance;
		}
	}
}