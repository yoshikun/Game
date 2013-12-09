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
     * 查询自定义数据(2:60)
     */
    public class ReqCustomDataResponse implements IResponse
    {
        /**
         * 数据内容
         */
        public var text:String;

        public function read(p:Packet):void
        {

            text = p.readUTF();
        }
    }
}