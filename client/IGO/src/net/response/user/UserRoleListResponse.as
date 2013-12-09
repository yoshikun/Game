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
     * 请求账号角色列表(2:2)
     */
    public class UserRoleListResponse implements IResponse
    {
        /**
         * 角色个数
         */
        public var num:uint;

        /**
         * 角色信息
         */
        public var userObjList:Array /* of SelectUserInfo */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			userObjList = [];
            for(var i:int = 0; i < num; i++){
                var selectUserInfo:SelectUserInfo = new SelectUserInfo();
                selectUserInfo.userID = p.readUnsignedInt();
                selectUserInfo.nickName = p.readMultiByte(33, "utf-8");
                selectUserInfo.accid = p.readUnsignedInt();
                selectUserInfo.type = p.readUnsignedByte();
                selectUserInfo.level = p.readUnsignedShort();
                selectUserInfo.sex = p.readUnsignedByte();
                selectUserInfo.bitmask = p.readUnsignedInt();
                userObjList.push(selectUserInfo);
            }
        }
    }
}