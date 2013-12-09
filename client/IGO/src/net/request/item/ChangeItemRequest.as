/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 镶嵌（分解）物品(11:17)
     */
    public class ChangeItemRequest implements IRequest
    {
        /**
         * 操作类型 1镶嵌 2分解 3拆分 4合成 5打造 6升级 7洗练 8熔炼 9时装升级 10时装分解 11时装继承 12升星 13重置
         */
        public var type:uint;
    
        /**
         * 道具ID
         */
        public var itemList:Array;
    
        /**
         * 数量
         */
        public var num:uint;
    
        /**
         * 洗练时是否保持属性，1保持 0不保持
         */
        public var keepEffect:uint;
    
        public function get module():int
        {
            return 11;
        }

        public function get action():int
        {
            return 17;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(type);
			var len:int = itemList.length;
			for (var i:int = 0; i < 6; i++){
				p.writeUnsignedInt(itemList[i]);
			}
            p.writeShort(num);
            p.writeByte(keepEffect);
        }
    }
}