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
     * 扫荡结果通知(2:102)
     */
    public class MopUpResultResponse implements IResponse
    {
        /**
         *  扫荡数量
         */
        public var num:uint;

        /**
         * 扫荡奖励信息
         */
        public var infoList:Array /* of MopUpRewardInfo */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var mopUpRewardInfo:MopUpRewardInfo = new MopUpRewardInfo();
                mopUpRewardInfo.sceneID = p.readUnsignedInt();
                mopUpRewardInfo.expReward = p.readUnsignedInt();
                mopUpRewardInfo.goldReward = p.readUnsignedInt();
                mopUpRewardInfo.heroExpReward = p.readUnsignedInt();
                mopUpRewardInfo.num = p.readUnsignedShort();
				mopUpRewardInfo.infoList = [];
                for(var j:int = 0; j < mopUpRewardInfo.num; j++){
                	var infoItemNumInfo:ItemNumInfo = new ItemNumInfo();
                	infoItemNumInfo.id = p.readUnsignedInt();
                	infoItemNumInfo.num = p.readUnsignedInt();
                	mopUpRewardInfo.infoList.push(infoItemNumInfo)
      	       }
                infoList.push(mopUpRewardInfo);
            }
        }
    }
}