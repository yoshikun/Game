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
     * 创建角色返回(1:14)
     */
    public class CreateSelectUserResponse implements IResponse
    {
        /**
         * 0:成功 1:错误
         */
        public var result:uint;

        public function read(p:Packet):void
        {

            result = p.readUnsignedInt();
        }
    }
}