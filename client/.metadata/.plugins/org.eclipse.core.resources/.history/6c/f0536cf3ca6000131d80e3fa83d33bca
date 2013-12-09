/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.scene
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 资源塔信息(5:60)
     */
    public class ResourcePetInfoResponse implements IResponse
    {
        /**
         * 资源塔ID
         */
        public var id:uint;

        /**
         * 积分所属
         */
        public var userID:uint;

        /**
         * 当前积分
         */
        public var curScore:uint;

        /**
         * 积分增长量
         */
        public var upScore:uint;

        public function read(p:Packet):void
        {

            id = p.readUnsignedInt();
            userID = p.readUnsignedInt();
            curScore = p.readUnsignedShort();
            upScore = p.readUnsignedShort();
        }
    }
}