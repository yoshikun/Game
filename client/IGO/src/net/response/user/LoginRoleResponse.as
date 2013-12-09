/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.user
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 登陆选择的角色ID返回(2:6)
     */
    public class LoginRoleResponse implements IResponse
    {
        /**
         * 结果 0未知错误 1ok 2角色被冻结 3找不到角色 4服务器内部错误 5防沉迷
         */
        public var ret:uint;

        /**
         * 允许登录的时间（秒）
         */
        public var enableTime:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            enableTime = p.readUnsignedInt();
        }
    }
}