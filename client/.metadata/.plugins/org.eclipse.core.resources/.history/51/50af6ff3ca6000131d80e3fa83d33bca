/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.scene
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 小兵升级(5:36)
     */
    public class UpgradeNpcResponse implements IResponse
    {
        /**
         * 0.未知 1.成功 2.资源不足 3.非法ID
         */
        public var ret:uint;

        /**
         * 宠物的基本id
         */
        public var baseID:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            baseID = p.readUnsignedInt();
        }
    }
}