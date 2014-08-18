/**
 * Copyright (c) 2012, www.yo.com All rights reserved.
 */
package com.yo.game.net.response.data
{
    import com.yo.framework.net.IResponse;
    import com.yo.game.net.vo.*;
    import com.yo.framework.net.Packet;

    /*@import*/

    /**
     * 人物主数据(2:2)
     */
    public class MainUserDataResponse implements IResponse
    {
        /**
         * 人物主数据结构体
         */
        public var data:MainUserData;

        public function read(p:Packet):void
        {

            data = new MainUserData();
            data.charid = p.readUnsignedInt();
            data.country = p.readUnsignedShort();
            data.level = p.readUnsignedShort();
            data.hp = p.readUnsignedInt();
            data.maxhp = p.readUnsignedInt();
            data.mp = p.readUnsignedInt();
            data.maxmp = p.readUnsignedInt();
            data.exp = p.readUnsignedInt();
            data.nextexp = p.readUnsignedInt();
            data.bitmask = p.readUnsignedInt();
        }
    }
}