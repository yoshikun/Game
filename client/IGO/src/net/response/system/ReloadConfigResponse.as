/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.system
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 刷新配置文件(1:10)
     */
    public class ReloadConfigResponse implements IResponse
    {
        /**
         * 结果 0失败 1成功
         */
        public var result:uint;

        public function read(p:Packet):void
        {

            result = p.readUnsignedByte();
        }
    }
}