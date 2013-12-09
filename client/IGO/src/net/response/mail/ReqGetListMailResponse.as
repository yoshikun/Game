/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.mail
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 获取邮件列表(18:4)
     */
    public class ReqGetListMailResponse implements IResponse
    {
        /**
         * 邮件数
         */
        public var num:uint;

        /**
         * 邮件基本信息
         */
        public var infoList:Array /* of MailHeadInfo */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var mailHeadInfo:MailHeadInfo = new MailHeadInfo();
                mailHeadInfo.id = p.readUnsignedInt();
                mailHeadInfo.state = p.readUnsignedByte();
                mailHeadInfo.title = p.readMultiByte(33, "utf-8");
                mailHeadInfo.fromName = p.readMultiByte(33, "utf-8");
                mailHeadInfo.delTime = p.readUnsignedInt();
                mailHeadInfo.createTime = p.readUnsignedInt();
                mailHeadInfo.accessory = p.readUnsignedByte();
                mailHeadInfo.itemGot = p.readUnsignedByte();
                mailHeadInfo.type = p.readUnsignedByte();
                infoList.push(mailHeadInfo);
            }
        }
    }
}