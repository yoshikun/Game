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
     * 创建角色返回(2:4)
     */
    public class CreateRoleResponse implements IResponse
    {
        /**
         * 结果 1ok 2 名字重复 3 名字包含不合法的内容
         */
        public var ret:uint;

        /**
         * 角色名称
         */
        public var nickname:String;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            nickname = p.readMultiByte(33, "utf-8");
        }
    }
}