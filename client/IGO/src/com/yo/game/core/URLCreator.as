package com.yo.game.core
{
	import br.com.stimuli.loading.BulkLoader;
	
	import com.yo.framework.manager.resource.IURLCreator;
	import com.yo.framework.manager.resource.ResourceManager;

	public class URLCreator implements IURLCreator
	{
		public function URLCreator()
		{
			init();
		}
		
		protected function init():void{
			var path:String = Config.getAssetPath();
			
			// 配置资源路径
			ResourceManager.instance.setUrl("config",           {path:"",            			   extension:".xml"});
			ResourceManager.instance.setUrl("animation_optim",  {path:path + "animation/",         extension:".swf"});
			ResourceManager.instance.setUrl("swf_animation",    {path:path + "animation/",         extension:".swf"});
			ResourceManager.instance.setUrl("effect",           {path:path + "effect/",            extension:".swf"});
			ResourceManager.instance.setUrl("scene",            {path:path + "scene/",             extension:".swf"});
			ResourceManager.instance.setUrl("scene.config",     {path:path + "map/",               extension:".xml"});
			ResourceManager.instance.setUrl("scene.mps",    	{path:path + "map/",               extension:".mps", type:BulkLoader.TYPE_BINARY});
			ResourceManager.instance.setUrl("icon.npc",         {path:path + "icon/npc/",          extension:".png"});
			ResourceManager.instance.setUrl("icon.street",      {path:path + "icon/street/",       extension:".png"});
			ResourceManager.instance.setUrl("icon.scene",       {path:path + "icon/scene/",        extension:".png"});
			ResourceManager.instance.setUrl("icon.monster",     {path:path + "icon/monster/",      extension:".png"});
			ResourceManager.instance.setUrl("swf",              {path:path + "swf/",               extension:".swf"});
			ResourceManager.instance.setUrl("sound",            {path:path + "sound/",             extension:".mp3"});
			ResourceManager.instance.setUrl("music",            {path:path + "music/",             extension:".flv"});
			ResourceManager.instance.setUrl("avatar",           {path:path + "avatar/",            extension:".swf"});
			
			ResourceManager.instance.setUrl("avatar.cloth.male",     {path:path + "avatar/cloth/male/",      extension:".swf"});
			ResourceManager.instance.setUrl("avatar.weapon.male",     {path:path + "avatar/weapon/male/",    extension:".swf"});
			ResourceManager.instance.setUrl("avatar.cloth.female",     {path:path + "avatar/cloth/female/",      extension:".swf"});
			ResourceManager.instance.setUrl("avatar.weapon.female",     {path:path + "avatar/weapon/female/",    extension:".swf"});
			
			ResourceManager.instance.setUrl("icon.useable", {path:path + "icon/useable/", extension:".png"});
			ResourceManager.instance.setUrl("icon.equipment", {path:path + "icon/equipment/", extension:".png"});
			ResourceManager.instance.setUrl("icon.symbol", {path:path + "icon/symbol/", extension:".png"});
			ResourceManager.instance.setUrl("icon.fashion", {path:path + "icon/fashion/", extension:".png"});
			ResourceManager.instance.setUrl("icon.gem", {path:path + "icon/gem/", extension:".png"});
			ResourceManager.instance.setUrl("icon.hero", {path:path + "icon/hero/", extension:".png"});
			ResourceManager.instance.setUrl("icon.other", {path:path + "icon/other/", extension:".png"});
			ResourceManager.instance.setUrl("icon.skill", {path:path + "icon/skill/", extension:".png"});
			ResourceManager.instance.setUrl("icon.pet", {path:path + "icon/pet/", extension:".png"});
			ResourceManager.instance.setUrl("icon.hireHero", {path:path + "icon/npc/", extension:".png"});
			ResourceManager.instance.setUrl("icon.battleUsable", {path:path + "icon/battleUsable/", extension:".png"});
			ResourceManager.instance.setUrl("icon.loot", {path:path + "icon/loot/", extension:".png"});
			
			ResourceManager.instance.setUrl("drama",    {path:path + "data/drama/", extension:".xml"});
			ResourceManager.instance.setUrl("zip",    {path:path + "data/", extension:".zip", type:BulkLoader.TYPE_BINARY});
			ResourceManager.instance.setUrl("data",             {path:path + "data/",              extension:".xml"});
			ResourceManager.instance.setUrl("txt",              {path:path + "data/",              extension:".txt"});
			
			ResourceManager.instance.setUrl("particle",         {path:path + "particle/",          extension:".png"});
			ResourceManager.instance.setUrl("light",         {path:path + "light/",          extension:".png"});
//			ResourceManager.instance.setUrl("shader",         {path:path + "shader/",          extension:".pbj", type:BulkLoader.TYPE_BINARY});
			ResourceManager.instance.setUrl("md5sums",         {path:path,          extension:".zip", type:BulkLoader.TYPE_BINARY});
			
			ResourceManager.instance.setUrl("icon.areaMap", {path:path + "icon/areaMap/", extension:".jpg"});
		}
	}
}