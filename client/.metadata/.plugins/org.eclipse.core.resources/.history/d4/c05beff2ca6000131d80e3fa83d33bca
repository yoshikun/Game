/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 赛跑下注(2:145)
     */
    public class NpcRaceBetRequest implements IRequest
    {
        /**
         * 下注npc
         */
        public var npcID:uint;
    
        /**
         * 下注金额
         */
        public var gold:uint;
    
        public function get module():uint
        {
            return 2;
        }

        public function get action():uint
        {
            return 145;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(npcID);
            p.writeUnsignedInt(gold);
        }
    }
}