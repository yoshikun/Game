/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 道具购买(11:37)
     */
    public class BuyItemRequest implements IRequest
    {
        /**
         *  购买道具种类个数
         */
        public var num:uint;
    
        /**
         * 道具信息
         */
        public var infoList:Array;
    
        public function get module():int
        {
            return 11;
        }

        public function get action():int
        {
            return 37;
        }

        public function write(p:Packet):void
        {
            
            p.writeShort(num);
			var len:int = infoList.length;
			for (var i:int = 0; i < len; i++){
				var info:ItemNumInfo = infoList[i] as ItemNumInfo;
				p.writeUnsignedInt(info.id);
				p.writeUnsignedInt(info.num);
			}
        }
    }
}