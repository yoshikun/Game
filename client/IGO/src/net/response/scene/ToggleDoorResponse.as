/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.scene
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 触发传送门(5:74)
     */
    public class ToggleDoorResponse implements IResponse
    {
        /**
         * 结果 0ok 1未开启 2未找到 3失败
         */
        public var ret:uint;

        /**
         * 传送门ID
         */
        public var id:uint;

        /**
         * 0 进入 1离开
         */
        public var state:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            id = p.readUnsignedInt();
            state = p.readUnsignedByte();
        }
    }
}