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
     * 选择出击宠物(5:34)
     */
    public class SelectAttackNpcResponse implements IResponse
    {
        /**
         * 0.ok 1.取消 2.资金不足 3生产成功 4位置错误
         */
        public var ret:uint;

        /**
         * 宠物ID
         */
        public var baseID:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            baseID = p.readUnsignedInt();
        }
    }
}