/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.item
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 英雄可洗技能(11:28)
     */
    public class EnableRebuildSkillsResponse implements IResponse
    {
        /**
         * 英雄 ID
         */
        public var heroID:uint;

        /**
         * 数量
         */
        public var num:uint;

        /**
         * 技能ID
         */
        public var infoList:Array /* of uint */;

        public function read(p:Packet):void
        {

            heroID = p.readUnsignedInt();
            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                infoList.push(p.readUnsignedShort());
            }
        }
    }
}