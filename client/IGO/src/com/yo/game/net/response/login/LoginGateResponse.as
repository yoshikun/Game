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
     * 登录到网关返回结果(1:8)
     */
    public class LoginGateResponse implements IResponse
    {
        /**
         * 结果 1,2其他地方登录 3验证错误 4网关人数满 5版本号不对 6IP冻结 7无效key
         */
        public var result:uint;

        public function read(p:Packet):void
        {

            result = p.readUnsignedByte();
        }
    }
}