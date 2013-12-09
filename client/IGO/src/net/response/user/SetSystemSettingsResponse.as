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
     * 系统设置(2:64)
     */
    public class SetSystemSettingsResponse implements IResponse
    {
        /**
         * 数据内容
         */
        public var dataList:Array /* of uint */;

        public function read(p:Packet):void
        {

			dataList = [];
            for(var i:int = 0; i < 5; i++){
                dataList.push(p.readUnsignedInt());
            }
        }
    }
}