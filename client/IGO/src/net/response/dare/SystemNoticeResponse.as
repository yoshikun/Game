/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.dare
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 系统公告(13:30)
     */
    public class SystemNoticeResponse implements IResponse
    {
        /**
         * notice.xml ID
         */
        public var id:uint;

        /**
         * 数量
         */
        public var num:uint;

        /**
         * 参数内容
         */
        public var infoList:Array /* of NoticePara */;

        public function read(p:Packet):void
        {

            id = p.readUnsignedInt();
            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var noticePara:NoticePara = new NoticePara();
                noticePara.id = p.readUnsignedInt();
                noticePara.data = p.readUnsignedInt();
                noticePara.name = p.readMultiByte(33, "utf-8");
                noticePara.type = p.readUnsignedByte();
                infoList.push(noticePara);
            }
        }
    }
}