/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.item
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 英雄升级(11:36)
     */
    public class UpgradeHeroResponse implements IResponse
    {
        /**
         * 结果 0未知失败 1成功 2金钱不足 3达到等级上限
         */
        public var ret:uint;

        /**
         * 暴击经验 0不是暴击
         */
        public var criExp:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            criExp = p.readUnsignedInt();
        }
    }
}