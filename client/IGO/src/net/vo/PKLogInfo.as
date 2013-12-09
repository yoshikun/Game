/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 竞技场日志信息
     */
    public class PKLogInfo
    {
        /**
         * 类型 1主动战胜 2主动战败 3被动战胜 4被动失败
         */
        public var type:uint;

        /**
         * PK玩家ID
         */
        public var pkUser:uint;

        /**
         * PK玩家姓名
         */
        public var pkUserName:String;

        /**
         * 发生时间
         */
        public var time:uint;

        /**
         * 数值变化
         */
        public var value:uint;

    }
}