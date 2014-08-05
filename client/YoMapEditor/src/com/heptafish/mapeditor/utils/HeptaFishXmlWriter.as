package com.heptafish.mapeditor.utils
{
	import flash.events.EventDispatcher;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import mx.controls.Alert;
	
	public class HeptaFishXmlWriter extends EventDispatcher
	{
		public function HeptaFishXmlWriter(model:MapModel, url:String)
		{
            url = File.applicationDirectory.nativePath.replace(/\\/g, "/") + url;
			
            var file:File = new File(url);
            var fileStream:FileStream = new FileStream();
			
			var xml:XML = MapEditorUtils.getMapXml(model);
			fileStream.openAsync(file, FileMode.WRITE);
			fileStream.writeUTFBytes(xml);
			Alert.show("地图文件写入成功！\n保存路径：" + file.nativePath);
		}
	}
}