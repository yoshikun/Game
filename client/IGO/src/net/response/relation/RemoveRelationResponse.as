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
     * 删除关系，返回(10:10)
     */
    public class RemoveRelationResponse implements IResponse
    {
        /**
         * 结果 1成功
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
        }
    }
}