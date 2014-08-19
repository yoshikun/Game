/**
 * Copyright (c) 2012, www.yo.com All rights reserved.
 */
package com.yo.game.net.response.mapscene
{
    import com.yo.framework.net.IResponse;
    import com.yo.game.net.vo.*;
    import com.yo.framework.net.Packet;

    /*@import*/

    /**
     * 地图上增加一个人物(3:2)
     */
    public class AddUserAndPosMapScreenStateResponse implements IResponse
    {
        /**
         * 人物基本数据及坐标和状态列表
         */
        public var data:MapUserDataPosState;

        public function read(p:Packet):void
        {

            data = new MapUserDataPosState();
            data.data = new UserData();
            data.data.charid = p.readUnsignedInt();
            data.data.name = p.readMultiByte(32, "utf-8");
            data.data.sex = p.readUnsignedByte();
            data.data.career = p.readUnsignedByte();
            data.data.country = p.readUnsignedShort();
            data.data.level = p.readUnsignedShort();
            data.data.unionID = p.readUnsignedInt();
            data.data.attackspeed = p.readUnsignedShort();
            data.data.movespeed = p.readUnsignedShort();
            data.x = p.readUnsignedInt();
            data.y = p.readUnsignedInt();
            data.dir = p.readUnsignedByte();
            data.num = p.readUnsignedShort();
				data.stateList = [];
                for(var i:int = 0; i < data.num; i++){
					data.stateList.push(p.readUnsignedShort());
      	       }
        }
    }
}