/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.hall
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 创建房间返回(4:2)
     */
    public class CreateRoomResponse implements IResponse
    {
        /**
         * 结果 0成功, 1人物状态不对 2等级不够 3未完成前置副本 4已完成不能重复 5缺少道具 6不在规定时间 7精力点不足 8悬赏次数不足 9惩罚时间 10有人未准备 11地图初始化失败 12活动已完成 13 错误
         */
        public var result:uint;

        public function read(p:Packet):void
        {

            result = p.readUnsignedByte();
        }
    }
}