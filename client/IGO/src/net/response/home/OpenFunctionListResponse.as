/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.home
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 开放的功能列表(15:4)
     */
    public class OpenFunctionListResponse implements IResponse
    {
        /**
         * 数量
         */
        public var num:uint;

        /**
         * 功能信息
         */
        public var infoList:Array /* of HomeFunc */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var homeFunc:HomeFunc = new HomeFunc();
                homeFunc.id = p.readUnsignedShort();
                homeFunc.type = p.readUnsignedShort();
                infoList.push(homeFunc);
            }
        }
    }
}