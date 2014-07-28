/**
 * Copyright (c) 2012, www.yo.com All rights reserved.
 */
package com.yo.game.net.response.login
{
    import com.yo.framework.net.IResponse;
    import com.yo.game.net.vo.*;
    import com.yo.framework.net.Packet;

    /*@import*/

    /**
     * 该区所有的角色信息 长度为0时 请发注册协议 为1时 直接发选择角色协议 >1时 玩家选择后再发协议(1:10)
     */
    public class SelectRoleInfoResponse implements IResponse
    {
        /**
         * 角色个数
         */
        public var num:uint;

        /**
         * 可供选择角色的信息
         */
        public var infoList:Array /* of SelectUserInfo */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var selectUserInfo:SelectUserInfo = new SelectUserInfo();
                selectUserInfo.accid = p.readUnsignedInt();
                selectUserInfo.charid = p.readUnsignedInt();
                selectUserInfo.nickName = p.readMultiByte(32, "utf-8");
                selectUserInfo.country = p.readUnsignedShort();
                selectUserInfo.level = p.readUnsignedShort();
                selectUserInfo.face = p.readUnsignedByte();
                selectUserInfo.bitmask = p.readUnsignedInt();
                infoList.push(selectUserInfo);
            }
        }
    }
}