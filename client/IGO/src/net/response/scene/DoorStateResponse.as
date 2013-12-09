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
     * 传送门信息(5:30)
     */
    public class DoorStateResponse implements IResponse
    {
        /**
         * 传送门数量
         */
        public var num:uint;

        /**
         * 传送门
         */
        public var infoList:Array /* of DoorInfo */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var doorInfo:DoorInfo = new DoorInfo();
                doorInfo.id = p.readUnsignedInt();
                doorInfo.state = p.readUnsignedByte();
                infoList.push(doorInfo);
            }
        }
    }
}