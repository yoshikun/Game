/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 小兵升级 + 转生(2:41)
     */
    public class UpgradeObtainPetRequest implements IRequest
    {
        /**
         * 小兵ID
         */
        public var id:uint;
    
        public function get module():int
        {
            return 2;
        }

        public function get action():int
        {
            return 41;
        }

        public function write(p:Packet):void
        {
            
            p.writeUnsignedInt(id);
        }
    }
}