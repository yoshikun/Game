/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.home
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 进入家园返回(15:2)
     */
    public class EnterHomeResponse implements IResponse
    {
        /**
         * 0成功 1家园加载错误
         */
        public var ret:uint;

        /**
         * 家园信息
         */
        public var info:HomeSceneInfo;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            info = new HomeSceneInfo();
            info.id = p.readUnsignedInt();
            info.name = p.readMultiByte(33, "utf-8");
            info.type = p.readUnsignedByte();
            info.openType = p.readUnsignedByte();
            info.level = p.readUnsignedShort();
            info.vip = p.readUnsignedByte();
        }
    }
}