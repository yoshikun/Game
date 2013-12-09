/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 英雄可洗技能(11:27)
     */
    public class EnableRebuildSkillsRequest implements IRequest
    {
        /**
         * 英雄 ID
         */
        public var heroID:uint;
    
        public function get module():uint
        {
            return 11;
        }

        public function get action():uint
        {
            return 27;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(heroID);
        }
    }
}