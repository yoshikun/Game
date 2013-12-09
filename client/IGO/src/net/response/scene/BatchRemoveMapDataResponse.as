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
     * 批量移除人物（宠物）(5:16)
     */
    public class BatchRemoveMapDataResponse implements IResponse
    {
        /**
         * 数量
         */
        public var num:uint;

        /**
         * 数据唯一ID
         */
        public var infoList:Array /* of GUID */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var gUID:GUID = new GUID();
                gUID.id = p.readUnsignedInt();
                gUID.type = p.readUnsignedByte();
                infoList.push(gUID);
            }
        }
    }
}