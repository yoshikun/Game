/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.scene
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 进入站街地图(5:4)
     */
    public class EnterStationMapResponse implements IResponse
    {
        /**
         * 结果 0成功 1不在规定时间 2处罚期 3错误
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
        }
    }
}