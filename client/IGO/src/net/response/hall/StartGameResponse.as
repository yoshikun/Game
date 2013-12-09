/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.hall
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 房主开始游戏(4:23)
     */
    public class StartGameResponse implements IResponse
    {
        /**
         * 用户ID
         */
        public var id:uint;

        /**
         * 副本ID
         */
        public var sceneID:uint;

        /**
         * 结果 同创建房间 CREATE_ROOM
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            id = p.readUnsignedInt();
            sceneID = p.readUnsignedInt();
            ret = p.readUnsignedByte();
        }
    }
}