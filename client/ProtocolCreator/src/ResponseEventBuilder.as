package
{
import com.api.services.base.CommandObj;
import com.api.services.base.Param;

public class ResponseEventBuilder extends BuilderBase
{
    public function ResponseEventBuilder(cmds:Array, objMap:Object)
    {
        super(cmds, objMap);
    }

	override protected function build():void
    {
        var result:String = PathManager.copyRight;
        result += "\npackage events";
        result += "\n{";
        result += "\n";
        result += "\nimport com.nali.core.events.NaliCoreEvent;";
        result += "\n";
        result += "\nimport com.nali.api.services.IResponse;";
        result += "\nimport flash.events.Event;";
        result += "\n";
        result += "\nimport org.robotlegs.utilities.modular.base.IModuleEvent;";
        result += "\n";
        result += "\n/**";
        result += "\n * Service事件对象，用于派遣从服务器端返回的数据。";
        result += "\n * ";
        result += "\n */";
        result += "\npublic class ServiceResponseEvent extends NaliCoreEvent implements IModuleEvent";
        result += "\n{";
        result += "\n    //==========================================================================";
        result += "\n    //  Class variables";
        result += "\n    //==========================================================================";
        result += "\n    /**";
        result += "\n    * 事件常量值前缀";
        result += "\n    */";
        result += "\n    static public const TYPE_PTEFIX:String = \"P\";";
        for each (var cmd:CommandObj in cmds)
        {
            result += "\n";
            result += "\n    //==========================================================================";
            result += "\n    //  " + cmd.value;
            result += "\n    //==========================================================================";
            for each (var p:Param in cmd.params)
            {
                if (p.isServerToClint && !p.useless)
                {
                    result += "\n    /** " + p.info + " */";
                    result += "\n    static public const " + cmd.value.toLocaleUpperCase() + "_" + p.value.toLocaleUpperCase() + ":String = \"P" + p.cmdIndex + "," + p.paramIndex + "\";";
                }
            }
        }
        result += "\n";
        result += "\n   /**";
        result += "\n    * 构造一个ServiceResponseEvent";
        result += "\n    * @param type 服务器端返回事件类型";
        result += "\n    * @param data 返回的数据对象，为弱类型。";
        result += "\n    * @param bubbles";
        result += "\n    * @param cancelable";
        result += "\n    * ";
        result += "\n    */ ";
        result += "\n    public function ServiceResponseEvent(type:String, data:IResponse, ";
        result += "\n                                        bubbles:Boolean=false, ";
        result += "\n                                        cancelable:Boolean=false)";
        result += "\n    {";
        result += "\n        super(type, bubbles, cancelable);";
        result += "\n        this._data = data;";
        result += "\n    }";
        result += "\n";
        result += "\n    //==========================================================================";
        result += "\n    //  Properties";
        result += "\n    //==========================================================================";
        result += "\n    private var _data:IResponse;";
        result += "\n    public function get data():IResponse";
        result += "\n    {";
        result += "\n        return _data;";
        result += "\n    }";
        result += "\n";
        result += "\n    //==========================================================================";
        result += "\n    //  Methods";
        result += "\n    //==========================================================================";
        result += "\n    override public function clone():Event";
        result += "\n    {";
        result += "\n        var event:ServiceResponseEvent = ";
        result += "\n           new ServiceResponseEvent(type, data, bubbles, cancelable);";
        result += "\n        return event;";
        result += "\n    }";
        result += "\n}";
        result += "\n}";

        var url:String = PathManager.protocolOutputPath + "/events/" + "ServiceResponseEvent.as";
        writeFile(url, result);
    }
}
}