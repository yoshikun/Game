/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 拾取熔炼获得的装备(11:65)
     */
    public class GetFusionItemRequest implements IRequest
    {
        /**
         * 数量
         */
        public var num:uint;
    
        /**
         * 道具唯一ID
         */
        public var itemList:Array;
    
        public function get module():uint
        {
            return 11;
        }

        public function get action():uint
        {
            return 65;
        }

        public function write(p:Packet):void
        {
            
            p.writeShort(num);
			var len:int = itemList.length;
			for (var i:int = 0; i < len; i++){
				p.writeUnsignedInt(itemList[i]);
			}
        }
    }
}