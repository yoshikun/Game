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
     * 添加剧情(2:92)
     */
    public class AddDramaResponse implements IResponse
    {
        /**
         * 剧情ID
         */
        public var id:uint;

        public function read(p:Packet):void
        {

            id = p.readUnsignedInt();
        }
    }
}