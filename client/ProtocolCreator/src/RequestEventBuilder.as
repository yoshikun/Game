package
{
	import com.api.services.base.CommandObj;
	import com.api.services.base.Param;
	
	import flash.events.Event;
	
	public class RequestEventBuilder extends BuilderBase
	{
	    static public const FILE_NAME:String = "ServiceRequestEvent";
	
	    public function RequestEventBuilder(cmds:Array, objMap:Object)
	    {
	        super(cmds, objMap);
	    }
	
	    override protected function build():void
	    {
	        var result:String = PathManager.copyRight;
	        result += "\npackage events";
	        result += "\n{";
	        result += "\n";
	        result += "\nimport com.nali.api.services.IRequest;";
	        result += "\nimport com.nali.core.events.NaliCoreEvent;";
	        result += "\n";
	        result += "\nimport flash.events.Event;";
	        result += "\n";
	        result += "\nimport org.robotlegs.utilities.modular.base.IModuleEvent;";
	        result += "\n";
	        result += "\n/**";
	        result += "\n * 请求服务器事件对象，用于发送请求给服务器。";
	        result += "\n * ";
	        result += "\n */";
	        result += "\npublic class " + FILE_NAME + " extends NaliCoreEvent implements IModuleEvent";
	        result += "\n{";
	        result += "\n    //==========================================================================";
	        result += "\n    //  Class variables";
	        result += "\n    //==========================================================================";
	        result += "\n    /**";
	        result += "\n    * 事件常量值前缀";
	        result += "\n    */";
	        result += "\n    static public const TYPE_PTEFIX:String = \"\";";
	        for each (var cmd:CommandObj in cmds)
	        {
	            result += "\n";
	            result += "\n    //==========================================================================";
	            result += "\n    //  " + cmd.value;
	            result += "\n    //==========================================================================";
	            for each (var p:Param in cmd.params)
	            {
	                if (!p.isServerToClint && !p.useless)
	                {
	                    result += "\n    /** " + p.info + " */";
	                    result += "\n    static public const " + cmd.value.toLocaleUpperCase() + "_" + p.value.toLocaleUpperCase() + ":String = \"" + p.cmdIndex + "," + p.paramIndex + "\";";
	                }
	            }
	        }
	        result += "\n";
	        result += "\n   /**";
	        result += "\n    * 构造一个" + FILE_NAME + "";
	        result += "\n    * @param type 请求服务器类型";
	        result += "\n    * @param request 请求的参数";
	        result += "\n    * @param bubbles";
	        result += "\n    * @param cancelable";
	        result += "\n    * ";
	        result += "\n    */ ";
	        result += "\n    public function " + FILE_NAME + "(type:String, request:IRequest, ";
	        result += "\n                                        bubbles:Boolean=false, ";
	        result += "\n                                        cancelable:Boolean=false)";
	        result += "\n    {";
	        result += "\n        super(type, bubbles, cancelable);";
	        result += "\n        this._request = request;";
	        result += "\n    }";
	        result += "\n";
	        result += "\n    //==========================================================================";
	        result += "\n    //  Properties";
	        result += "\n    //==========================================================================";
	        result += "\n    private var _request:IRequest;";
	        result += "\n    public function get request():IRequest";
	        result += "\n    {";
	        result += "\n        return _request;";
	        result += "\n    }";
	        result += "\n";
	        result += "\n    //==========================================================================";
	        result += "\n    //  Methods";
	        result += "\n    //==========================================================================";
	        result += "\n    override public function clone():Event";
	        result += "\n    {";
	        result += "\n        var event:" + FILE_NAME + " = ";
	        result += "\n           new " + FILE_NAME + "(type, request, bubbles, cancelable);";
	        result += "\n        return event;";
	        result += "\n    }";
	        result += "\n}";
	        result += "\n}";
	        
	        var url:String = PathManager.protocolOutputPath + "/events/" + "" + FILE_NAME + ".as";
	        writeFile(url, result);
	    }
	}
}