/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.relation
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 添加黑名单，返回(10:8)
     */
    public class AddBadRelationResponse implements IResponse
    {
        /**
         * 结果 1添加成功 2不能加自己 3名单已满 4已经存在 5不在线无法确认
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
        }
    }
}