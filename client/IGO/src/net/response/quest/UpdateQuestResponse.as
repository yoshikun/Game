/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.quest
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 获取新任务列表(12:4)
     */
    public class UpdateQuestResponse implements IResponse
    {
        /**
         * 任务数量
         */
        public var num:uint;

        /**
         * 任务信息
         */
        public var infoList:Array /* of QuestInfo */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var questInfo:QuestInfo = new QuestInfo();
                questInfo.id = p.readUnsignedInt();
                questInfo.num = p.readUnsignedShort();
				questInfo.infoList = [];
                for(var j:int = 0; j < questInfo.num; j++){
                	var infoQuestValueInfo:QuestValueInfo = new QuestValueInfo();
                	infoQuestValueInfo.id = p.readUnsignedInt();
                	infoQuestValueInfo.value = p.readUnsignedShort();
                	questInfo.infoList.push(infoQuestValueInfo)
      	       }
                infoList.push(questInfo);
            }
        }
    }
}