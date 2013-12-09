/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.user
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 开始扫荡(2:100)
     */
    public class StartMopUpResponse implements IResponse
    {
        /**
         * 0成功 1CD中 2精力点不足 3千层塔次数不足
         */
        public var ret:uint;

        /**
         * 副本类型 1单人副本 2千层塔
         */
        public var sceneType:uint;

        /**
         * 扫荡单人副本要指定副本ID
         */
        public var sceneID:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            sceneType = p.readUnsignedByte();
            sceneID = p.readUnsignedInt();
        }
    }
}