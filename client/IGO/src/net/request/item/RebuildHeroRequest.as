/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 英雄技能配置(11:29)
     */
    public class RebuildHeroRequest implements IRequest
    {
        /**
         * 英雄ID
         */
        public var heroID:uint;
    
        /**
         * 保留技能
         */
        public var skillList:Array;
    
        public function get module():int
        {
            return 11;
        }

        public function get action():int
        {
            return 29;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(heroID);
			var len:int = skillList.length;
			for (var i:int = 0; i < 5; i++){
				p.writeShort(skillList[i]);
			}
        }
    }
}