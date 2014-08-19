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
     * 设置人物的红和蓝(2:4)
     */
    public class SetHpAndMpDataResponse implements IResponse
    {
        /**
         * 红
         */
        public var hp:uint;

        /**
         * 蓝
         */
        public var mp:uint;

        public function read(p:Packet):void
        {

            hp = p.readUnsignedInt();
            mp = p.readUnsignedInt();
        }
    }
}