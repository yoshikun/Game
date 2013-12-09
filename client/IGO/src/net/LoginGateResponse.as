/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net
{
	import com.yo.net.IResponse;
	import com.yo.net.Packet;
    

    /*@import*/

    /**
     * 登录到网关返回结果(1:4)
     */
    public class LoginGateResponse implements IResponse
    {
        /**
         * 结果 1成功,2其他地方登录 3验证错误 4网关人数满 5版本号不对 6IP冻结 7无效key
         */
        public var result:uint;

        public function read(p:Packet):void
        {

            result = p.readUnsignedByte();
        }
    }
}