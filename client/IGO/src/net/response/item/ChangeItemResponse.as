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
     * 镶嵌（分解）物品(11:18)
     */
    public class ChangeItemResponse implements IResponse
    {
        /**
         * 操作类型 1镶嵌 2分解 3拆分 4合成 5打造 6升级 7洗练 8熔炼 9时装升级 10时装分解 11时装继承 12升星 13重置
         */
        public var type:uint;

        /**
         * 结果 1成功 0失败 2金钱不足 3达到最大等级 4背包空间不足 5成功保持等级 6成功降级 7需求道具不足
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            type = p.readUnsignedByte();
            ret = p.readUnsignedByte();
        }
    }
}