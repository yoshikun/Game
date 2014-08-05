package com.yo.framework.manager.scene
{
	import com.yo.framework.mvc.interfaces.IDisposable;
	import com.yo.framework.mvc.interfaces.IUpdateable;

	public interface IScene extends IUpdateable, IDisposable
	{
		function enter():void;
		
		function exit():void;
	}
}