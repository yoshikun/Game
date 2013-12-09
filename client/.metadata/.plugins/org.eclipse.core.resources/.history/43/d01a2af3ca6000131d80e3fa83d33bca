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
     * 宝石转换(11:60)
     */
    public class StoneTransformResponse implements IResponse
    {
        /**
         * 结果 0成功 1资源不足 2类型不正确 3数量不对 4背包已满 5失败 
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
        }
    }
}