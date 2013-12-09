/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.user
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 用户斗兽信息(2:110)
     */
    public class UserFightbossInfoResponse implements IResponse
    {
        /**
         * 怪物ID
         */
        public var boss:uint;

        /**
         * 场景ID
         */
        public var scene:uint;

        /**
         * 本Boss世界最好成绩
         */
        public var globalScore:uint;

        /**
         * 最高纪录保持者ID
         */
        public var holderID:uint;

        /**
         * 最高纪录保持者
         */
        public var holder:String;

        /**
         * 本Boss个人最好成绩
         */
        public var bestScore:uint;

        /**
         * 当日最好成绩
         */
        public var dayScore:uint;

        /**
         * 排名百分比
         */
        public var rank:uint;

        public function read(p:Packet):void
        {

            boss = p.readUnsignedInt();
            scene = p.readUnsignedInt();
            globalScore = p.readUnsignedShort();
            holderID = p.readUnsignedInt();
            holder = p.readMultiByte(33, "utf-8");
            bestScore = p.readUnsignedShort();
            dayScore = p.readUnsignedShort();
            rank = p.readUnsignedByte();
        }
    }
}