/**
 * Copyright (c) 2012, www.yo.com All rights reserved.
 */
package com.yo.game.net.response.mapscene
{
    import com.yo.framework.net.IResponse;
    import com.yo.game.net.vo.*;
    import com.yo.framework.net.Packet;

    /*@import*/

    /**
     * 地图上删除一个人物(3:4)
     */
    public class RemoveUserMapScreenResponse implements IResponse
    {
        /**
         * 角色id
         */
        public var charid:uint;

        public function read(p:Packet):void
        {

            charid = p.readUnsignedInt();
        }
    }
}