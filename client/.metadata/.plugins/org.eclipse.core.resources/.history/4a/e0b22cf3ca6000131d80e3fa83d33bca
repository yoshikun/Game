/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.mail
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 获取邮件附件返回(18:8)
     */
    public class ReqGetItemMailResponse implements IResponse
    {
        /**
         * 结果 0未知 1成功 2背包满 3金钱不足 4游戏币不足 5已取 6没附件 7邮件状态不对 8未找到邮件 9邮件不是你的
         */
        public var ret:uint;

        /**
         * 邮件id
         */
        public var id:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            id = p.readUnsignedInt();
        }
    }
}