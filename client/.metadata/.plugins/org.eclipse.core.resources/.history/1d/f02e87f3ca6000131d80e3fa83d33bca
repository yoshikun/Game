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
     * 保存开启ui(2:94)
     */
    public class SaveUiOpenResponse implements IResponse
    {
        /**
         * 0成功 1失败
         */
        public var ret:uint;

        /**
         * ID
         */
        public var id:uint;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            id = p.readUnsignedInt();
        }
    }
}