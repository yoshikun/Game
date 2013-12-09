/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.dare
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 我的活动信息(13:22)
     */
    public class ReqMyActivitisResponse implements IResponse
    {
        /**
         * 数量
         */
        public var num:uint;

        /**
         * 活动信息
         */
        public var infoList:Array /* of ActivityInfo */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var activityInfo:ActivityInfo = new ActivityInfo();
                activityInfo.type = p.readUnsignedByte();
                activityInfo.doneNum = p.readUnsignedShort();
                infoList.push(activityInfo);
            }
        }
    }
}