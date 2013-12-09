/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.scene
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 初始化信息结束(5:32)
     */
    public class EndofInitResponse implements IResponse
    {
        public function read(p:Packet):void
        {

        }
    }
}