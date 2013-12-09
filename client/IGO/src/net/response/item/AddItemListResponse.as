/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.item
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 批量添加用户道具数据(11:2)
     */
    public class AddItemListResponse implements IResponse
    {
        /**
         * 物品动作类型 1初始化 2移动 3获得 4丢弃 5刷新
         */
        public var actionType:uint;

        /**
         * 续传标记 0初始化 1续传，不要清背包
         */
        public var flag:uint;

        /**
         * 数量
         */
        public var num:uint;

        /**
         * 物品数据
         */
        public var infoList:Array /* of ItemInfo */;

        public function read(p:Packet):void
        {

            actionType = p.readUnsignedByte();
            flag = p.readUnsignedByte();
            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var itemInfo:ItemInfo = new ItemInfo();
                itemInfo.id = p.readUnsignedInt();
                itemInfo.baseID = p.readUnsignedInt();
                itemInfo.pos = new ItemLocationInfo();
                itemInfo.pos.locationType = p.readUnsignedInt();
                itemInfo.pos.tableID = p.readUnsignedInt();
                itemInfo.pos.column = p.readUnsignedShort();
                itemInfo.pos.row = p.readUnsignedShort();
                itemInfo.num = p.readUnsignedInt();
                itemInfo.upgrade = p.readUnsignedByte();
                itemInfo.quality = p.readUnsignedByte();
                itemInfo.bind = p.readUnsignedByte();
                itemInfo.exp = p.readUnsignedInt();
                itemInfo.pDamage = p.readUnsignedShort();
                itemInfo.pdPercent = p.readUnsignedShort();
                itemInfo.defence = p.readUnsignedShort();
                itemInfo.maxHP = p.readUnsignedInt();
                itemInfo.resumeHP = p.readUnsignedShort();
                itemInfo.obtainTime = p.readUnsignedInt();
                itemInfo.endTime = p.readUnsignedInt();
                itemInfo.price = p.readUnsignedInt();
				itemInfo.starList = [];
                for(var j:int = 0; j < 10; j++){
					itemInfo.starList.push(p.readUnsignedInt());
      	       }
				itemInfo.socketList = [];
                for(var k:int = 0; k < 6; k++){
                	var infoSocketInfo:SocketInfo = new SocketInfo();
                	infoSocketInfo.type = p.readUnsignedByte();
                	infoSocketInfo.itemID = p.readUnsignedInt();
					infoSocketInfo.fixEffectList = [];
                	for(var m:int = 0; m < 5; m++){
                		var itemEffect:ItemEffect = new ItemEffect();
						itemEffect.type = p.readUnsignedByte();
						itemEffect.id = p.readUnsignedShort();
						itemEffect.value = p.readUnsignedInt();
						infoSocketInfo.fixEffectList.push(itemEffect);
					}
					infoSocketInfo.skillList = [];
                	for(var n:int = 0; n < 3; n++){
						infoSocketInfo.skillList.push(p.readUnsignedShort());
					}
                	itemInfo.socketList.push(infoSocketInfo)
      	       }
				itemInfo.fixEffectList = [];
                for(var x:int = 0; x < 5; x++){
                	var infoItemEffect:ItemEffect = new ItemEffect();
                	infoItemEffect.type = p.readUnsignedByte();
                	infoItemEffect.id = p.readUnsignedShort();
                	infoItemEffect.value = p.readUnsignedInt();
                	itemInfo.fixEffectList.push(infoItemEffect)
      	       }
				itemInfo.randEffectList = [];
                for(var y:int = 0; y < 5; y++){
                	var infoItemEffect:ItemEffect = new ItemEffect();
                	infoItemEffect.type = p.readUnsignedByte();
                	infoItemEffect.id = p.readUnsignedShort();
                	infoItemEffect.value = p.readUnsignedInt();
                	itemInfo.randEffectList.push(infoItemEffect)
      	       }
				itemInfo.growEffectList = [];
                for(var z:int = 0; z < 5; z++){
                	var infoItemEffect:ItemEffect = new ItemEffect();
                	infoItemEffect.type = p.readUnsignedByte();
                	infoItemEffect.id = p.readUnsignedShort();
                	infoItemEffect.value = p.readUnsignedInt();
                	itemInfo.growEffectList.push(infoItemEffect)
      	       }
				itemInfo.skillList = [];
                for(var a:int = 0; a < 3; a++){
					itemInfo.skillList.push(p.readUnsignedShort());
      	       }
                infoList.push(itemInfo);
            }
        }
    }
}