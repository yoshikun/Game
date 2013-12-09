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
     * 资源加载完成，进入副本地图(5:2)
     */
    public class EnterCopyMapResponse implements IResponse
    {
        /**
         * 结果 1ok
         */
        public var ret:uint;

        /**
         * 用户id
         */
        public var userID:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            userID = p.readUnsignedInt();
        }
    }
}