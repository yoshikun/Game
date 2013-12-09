/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.item
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 英雄升级、进阶加速（修改冷却时间）(11:34)
     */
    public class UpgradeHeroSpeedResponse implements IResponse
    {
        /**
         * 结果 0未知失败 1成功 2消耗不足
         */
        public var ret:uint;

        /**
         * 类型 1进阶 2升级
         */
        public var type:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            type = p.readUnsignedByte();
        }
    }
}