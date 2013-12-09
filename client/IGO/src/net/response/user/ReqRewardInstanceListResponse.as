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
     * 请求悬赏副本信息(2:84)
     */
    public class ReqRewardInstanceListResponse implements IResponse
    {
        /**
         * 类型 1初始化 2更新
         */
        public var actionType:uint;

        /**
         * 可进行次数
         */
        public var insCount:uint;

        /**
         * 可购买次数
         */
        public var insBuyCount:uint;

        /**
         * 上次刷新时间（秒）
         */
        public var lastRefreshTime:uint;

        /**
         * 数量
         */
        public var num:uint;

        /**
         * 悬赏副本信息
         */
        public var infoList:Array /* of RewardInsInfo */;

        public function read(p:Packet):void
        {

            actionType = p.readUnsignedByte();
            insCount = p.readUnsignedInt();
            insBuyCount = p.readUnsignedInt();
            lastRefreshTime = p.readUnsignedInt();
            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var rewardInsInfo:RewardInsInfo = new RewardInsInfo();
                rewardInsInfo.insSceneID = p.readUnsignedInt();
                rewardInsInfo.state = p.readUnsignedByte();
                infoList.push(rewardInsInfo);
            }
        }
    }
}