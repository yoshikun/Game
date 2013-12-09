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
     * 矿产（金钱）更新(5:28)
     */
    public class GoldMineResponse implements IResponse
    {
        /**
         * 玩家id
         */
        public var userID:uint;

        /**
         * 金币数量
         */
        public var gold:uint;

        /**
         * 金币每秒产出
         */
        public var goldspeed:uint;

        public function read(p:Packet):void
        {

            userID = p.readUnsignedInt();
            gold = p.readUnsignedInt();
            goldspeed = p.readUnsignedShort();
        }
    }
}