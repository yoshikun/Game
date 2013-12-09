/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.union
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 公会抽奖数据返回(7:38)
     */
    public class UnionLotteryContentResponse implements IResponse
    {
        /**
         * 剩余抽奖次数
         */
        public var count:uint;

        /**
         * 数量
         */
        public var num:uint;

        /**
         * 抽奖数据
         */
        public var dataList:Array /* of LotteryData */;

        public function read(p:Packet):void
        {

            count = p.readUnsignedShort();
            num = p.readUnsignedShort();
			dataList = [];
            for(var i:int = 0; i < num; i++){
                var lotteryData:LotteryData = new LotteryData();
                lotteryData.pos = p.readUnsignedByte();
                lotteryData.item = new ItemInfo();
                lotteryData.item.id = p.readUnsignedInt();
                lotteryData.item.baseID = p.readUnsignedInt();
                lotteryData.item.pos = new ItemLocationInfo();
            lotteryData.item.pos.locationType = p.readUnsignedInt();
            lotteryData.item.pos.tableID = p.readUnsignedInt();
            lotteryData.item.pos.column = p.readUnsignedShort();
            lotteryData.item.pos.row = p.readUnsignedShort();
                lotteryData.item.num = p.readUnsignedInt();
                lotteryData.item.upgrade = p.readUnsignedByte();
                lotteryData.item.quality = p.readUnsignedByte();
                lotteryData.item.bind = p.readUnsignedByte();
                lotteryData.item.exp = p.readUnsignedInt();
                lotteryData.item.pDamage = p.readUnsignedShort();
                lotteryData.item.pdPercent = p.readUnsignedShort();
                lotteryData.item.defence = p.readUnsignedShort();
                lotteryData.item.maxHP = p.readUnsignedInt();
                lotteryData.item.resumeHP = p.readUnsignedShort();
                lotteryData.item.obtainTime = p.readUnsignedInt();
                lotteryData.item.endTime = p.readUnsignedInt();
                lotteryData.item.price = p.readUnsignedInt();
				lotteryData.item.starList = [];
                for(var j:int = 0; j < 10; j++){
					lotteryData.item.starList.push(p.readUnsignedInt());
				}
				lotteryData.item.socketList = [];
                for(var k:int = 0; k < 6; k++){
					var dataSocketInfo:SocketInfo = new SocketInfo()
            		dataSocketInfo.type = p.readUnsignedByte();
            		dataSocketInfo.itemID = p.readUnsignedInt();
						dataSocketInfo.fixEffectList = [];
                for(var m:int = 0; m < 5; m++){
            	var infoItemEffect:ItemEffect = new ItemEffect();
            	infoItemEffect.type = p.readUnsignedByte();
            	infoItemEffect.id = p.readUnsignedShort();
            	infoItemEffect.value = p.readUnsignedInt();
            			dataSocketInfo.fixEffectList.push(infoItemEffect)
      	       }
						dataSocketInfo.skillList = [];
                for(var n:int = 0; n < 3; n++){
							dataSocketInfo.skillList.push(p.readUnsignedShort());
      	       }
					lotteryData.item.socketList.push(dataSocketInfo);
				}
				lotteryData.item.fixEffectList = [];
                for(var x:int = 0; x < 5; x++){
					var dataItemEffect:ItemEffect = new ItemEffect()
            		dataItemEffect.type = p.readUnsignedByte();
            		dataItemEffect.id = p.readUnsignedShort();
            		dataItemEffect.value = p.readUnsignedInt();
					lotteryData.item.fixEffectList.push(dataItemEffect);
				}
				lotteryData.item.randEffectList = [];
                for(var y:int = 0; y < 5; y++){
					var dataItemEffect:ItemEffect = new ItemEffect()
            		dataItemEffect.type = p.readUnsignedByte();
            		dataItemEffect.id = p.readUnsignedShort();
            		dataItemEffect.value = p.readUnsignedInt();
					lotteryData.item.randEffectList.push(dataItemEffect);
				}
				lotteryData.item.growEffectList = [];
                for(var z:int = 0; z < 5; z++){
					var dataItemEffect:ItemEffect = new ItemEffect()
            		dataItemEffect.type = p.readUnsignedByte();
            		dataItemEffect.id = p.readUnsignedShort();
            		dataItemEffect.value = p.readUnsignedInt();
					lotteryData.item.growEffectList.push(dataItemEffect);
				}
				lotteryData.item.skillList = [];
                for(var a:int = 0; a < 3; a++){
					lotteryData.item.skillList.push(p.readUnsignedShort());
				}
                dataList.push(lotteryData);
            }
        }
    }
}