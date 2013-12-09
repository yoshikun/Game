/*
 * Copyright (c) 2011, wersling.com All rights reserved.
 */
package loaderqueue.adapter
{
import loaderqueue.ILoaderAdapter;
import loaderqueue.LoaderQueueEvent;

import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.system.LoaderContext;

/**
 * 将URLLoader类包装成可用于LoaderQueue的适配器
 * @see net.manaca.loaderqueue#LoaderQueue
 */
public class URLLoaderAdapter extends AbstractLoaderAdapter implements ILoaderAdapter
{
    /**
     * 构造函数.
     * @param priority 等级值,数值越小等级越高,越早被下载
     * @param urlRequest 需下载项的url地址
     */
    public function URLLoaderAdapter(priority:uint, urlRequest:URLRequest)
    {
        super(priority, urlRequest, null);
    }

    /**
     * @inheritDoc
     */  
    public function get bytesLoaded():Number
    {
        return adaptee ? adaptee.bytesLoaded : 0;
    }
    
    /**
     * @inheritDoc
     */  
    public function get bytesTotal():Number
    {
        return adaptee ? adaptee.bytesTotal : 0;
    }

	private var _adaptee:URLLoader;
	
    /**
     * 返回加载对象具体实例。
     */  
    public function get adaptee():URLLoader
    {
        return _adaptee;
    }
    
    /**
     * The data received from the load operation.
     */    
    public function get data():*
    {
        return adaptee.data;
    }

    /**
     * 消毁此项目内在引用
     * 调用此方法后，此adapter实例会自动从LoaderQueue中移出
     * p.s: 停止下载的操作LoaderQueue会自动处理
     */
    override public function dispose():void
    {
        stop();
        super.dispose();
        _adaptee = null;
    }

	override public function start():void
    {
        _adaptee = new URLLoader();
        adapteeAgent = _adaptee;
        preStartHandle();
        try
        {
            adaptee.load(urlRequest);
        }
        catch (error:Error)
        {
            dispatchEvent(new LoaderQueueEvent(LoaderQueueEvent.TASK_ERROR, customData));
        }
    }

	public function stop():void
    {
        preStopHandle();
        try
        {
            adaptee.close();
        }
        catch (error:Error)
        {
            //do nothing
        }
    }
}
}
