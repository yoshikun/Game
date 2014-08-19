package com.yo.framework.interfaces
{
	import com.yo.framework.mvc.interfaces.IDisposable;
	import com.yo.framework.mvc.interfaces.IUpdateable;
	import com.yo.framework.mvc.interfaces.IVisible;

	/**
	 * 游戏实体基础接口
	 * @author yoshikun
	 * 
	 */	
	public interface IComponent extends IDisposable, IRenderable, IUpdateable, IVisible
	{

	}
}