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
     * 该区所有的角色信息 长度为0时 请发注册协议 为1时 直接发选择角色协议 >1时 玩家选择后再发协议(1:7)
     */
    public class SelectRoleInfoResponse implements IResponse
    {
        public function read(p:Packet):void
        {

        }
    }
}