package
{
	public interface ILoader
	{
		function isStarted():Boolean;
		
		function loadSyn(callBack:Function, tryTime:int = 1):void;
		
		function cancel():void;
	}
}