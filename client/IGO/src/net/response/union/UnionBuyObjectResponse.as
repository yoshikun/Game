/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.union
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 公会商店购买道具返回(7:42)
     */
    public class UnionBuyObjectResponse implements IResponse
    {
        /**
         * 0成功 1资源不足 2背包满 3未找到道具 4公会等级不足 5错误
         */
        public var ret:uint;

        /**
         * 道具ID
         */
        public var id:uint;

        /**
         * 道具数量
         */
        public var num:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            id = p.readUnsignedInt();
            num = p.readUnsignedInt();
        }
    }
}