/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.union
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 创建公会返回(7:10)
     */
    public class CreateUnionResponse implements IResponse
    {
        /**
         * 0成功 1名称不合法 2已存在 3资源不足 4等级不够 5已在公会 6申请入会状态 7创建处罚期 8未知错误
         */
        public var ret:uint;

        /**
         * 公会ID
         */
        public var unionID:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            unionID = p.readUnsignedInt();
        }
    }
}