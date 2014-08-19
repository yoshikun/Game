package com.yo.framework.utils
{
    import com.adobe.utils.StringHelper;
    import com.yo.framework.manager.resource.LoaderName;
    import com.yo.framework.manager.resource.ResourceManager;
    
    import flash.utils.Dictionary;

    public class LangManager
    {
        private static var _list:Dictionary;
        
        public function LangManager()
        {
        }
		
		public static function setup():void
		{
			_list = new Dictionary();
			
			var data:XML = ResourceManager.instance.getResource("language", "config", LoaderName.PRE_LOAD) as XML;
			for each (var item:XML in data.i) 
			{
				_list[String(item.@id)] = item.toString();
			}
//			trace(get("clear_resource", "你来", "游戏"));
		}
		
		/**
		 * 
		 * @param key
		 * @param args
		 * @return 
		 * 
		 */
        public static function get(key:String, ...args):String
		{
			var str:String = _list[key];
			if(args == null || args.length <= 0)
			{
				return str;
			}
			
			for(var i:uint = 0; i < args.length; i++)
			{
				str = StringHelper.replaceStr(str,"{"+i.toString()+"}",args[i]);
			}
			
            return str;
        }
    }
}