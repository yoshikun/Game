/**
 * Copyright (c) 2012, www.yo.com All rights reserved.
 */
package com.yo.game.net.response.data
{
    import com.yo.framework.net.IResponse;
    import com.yo.game.net.vo.*;
    import com.yo.framework.net.Packet;

    /*@import*/

    /**
     * 人物地图信息(2:8)
     */
    public class MapScreenSizeDataResponse implements IResponse
    {
        /**
         * 场景宽带
         */
        public var width:uint;

        /**
         * 场景高度
         */
        public var height:uint;

        /**
         * 人物X坐标
         */
        public var mainRoleX:uint;

        /**
         * 人物Y坐标
         */
        public var mainRoleY:uint;

        /**
         * 地图名称
         */
        public var strMapName:String;

        /**
         * 地图文件名称
         */
        public var strFileName:String;

        public function read(p:Packet):void
        {

            width = p.readUnsignedInt();
            height = p.readUnsignedInt();
            mainRoleX = p.readUnsignedInt();
            mainRoleY = p.readUnsignedInt();
            strMapName = p.readMultiByte(32, "utf-8");
            strFileName = p.readMultiByte(32, "utf-8");
        }
    }
}