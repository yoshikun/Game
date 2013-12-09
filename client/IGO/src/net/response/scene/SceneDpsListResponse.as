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
     * 战斗伤害输出(5:86)
     */
    public class SceneDpsListResponse implements IResponse
    {
        /**
         * 玩家总数
         */
        public var allNum:uint;

        /**
         * 排行数量
         */
        public var num:uint;

        /**
         * 信息
         */
        public var infoList:Array /* of DpsInfo */;

        public function read(p:Packet):void
        {

            allNum = p.readUnsignedShort();
            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var dpsInfo:DpsInfo = new DpsInfo();
                dpsInfo.userID = p.readUnsignedInt();
                dpsInfo.nickName = p.readMultiByte(33, "utf-8");
                dpsInfo.unionID = p.readUnsignedInt();
                dpsInfo.unionName = p.readMultiByte(33, "utf-8");
                dpsInfo.value = p.readUnsignedInt();
                dpsInfo.rank = p.readUnsignedInt();
                infoList.push(dpsInfo);
            }
        }
    }
}