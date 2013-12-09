/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.user
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 查询角色禁止进入副本时间(2:44)
     */
    public class ReqForbidInstanceTimeResponse implements IResponse
    {
        /**
         * 数量
         */
        public var num:uint;

        /**
         * 信息
         */
        public var infoList:Array /* of ForbidInsTime */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var forbidInsTime:ForbidInsTime = new ForbidInsTime();
                forbidInsTime.type = p.readUnsignedByte();
                forbidInsTime.time = p.readUnsignedInt();
                forbidInsTime.allTime = p.readUnsignedInt();
                infoList.push(forbidInsTime);
            }
        }
    }
}