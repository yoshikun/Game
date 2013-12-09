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
     * 请求申请者返回(7:16)
     */
    public class ApplyListResponse implements IResponse
    {
        /**
         * 公会信息数量
         */
        public var num:uint;

        /**
         * 公会信息
         */
        public var infoList:Array /* of ApplyInfo */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var applyInfo:ApplyInfo = new ApplyInfo();
                applyInfo.userID = p.readUnsignedInt();
                applyInfo.nickName = p.readMultiByte(33, "utf-8");
                applyInfo.sex = p.readUnsignedByte();
                applyInfo.level = p.readUnsignedShort();
                applyInfo.combat = p.readUnsignedInt();
                applyInfo.applyTime = p.readUnsignedInt();
                infoList.push(applyInfo);
            }
        }
    }
}